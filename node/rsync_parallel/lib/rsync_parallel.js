var async = require ('async');
var chalk = require('chalk');
var exec = require('child_process').exec;
var fs = require('fs');
var lodash = require('lodash');
var path = require('path');


function rsync_parallel (source, destination, flags) {
  flags.push('-l');
  flags.push('--dry-run');
  flags.push('--out-format="%f"');
  flags.push('--exclude=".DS_Store"')
  flags.push('--exclude=".AppleDouble"')
  flags.push(source);
  flags.push(destination);

  source = source.replace(/^~/, getHomePath());
  destination = destination.replace(/^~/, getHomePath());

  var files = [];
  var command = 'rsync ' + flags.join(' ');

  print(
    chalk.yellow('Figuring out file list...'),
    command
  )

  var callback = function () {
    execTransfer(source, destination, files);
  };

  var rsync = exec(command, callback);
  rsync.stdout.on('data', function(data) {
    var filterEmpty = function (file) {
      if (file.length) return true;
      return false;
    };

    var convertToAbsolute = function (file) {
      if (/^(Users|Volumes)\//.test(file)) file = '/' + file;
      return path.resolve(file);
    };

    var filterFiles = function (file) {
      try {
        var stats = fs.lstatSync(file);
        return stats.isFile();
      } catch (err) {
        return false;
      }
    };

    var convertToRelative = function (file) {
      return file.replace(path.resolve(path.dirname(source)) + '/', '');
    };

    files = lodash(data)
      .split('\n')
      .filter(filterEmpty)
      .map(convertToAbsolute)
      .filter(filterFiles)
      .map(convertToRelative)
      .value()
      .concat(files)
      .sort();
  });
};

function execTransfer (source, destination, files) {
  print(
    chalk.yellow('Found file list...'),
    files
  )

  print(chalk.yellow('Transfering files...'))

  var callback = function(err, results) {
    print(chalk.yellow('Transfering done.'))
  };

  async.parallelLimit(generateTransferTasks(source, destination, files), 10, callback)

};

function generateTransferTasks (source, destination, files) {
  source = path.dirname(path.resolve(source));
  destination = path.relative(source, path.resolve(destination)) + '/.';
  var generateToken = function (file) {
    var fileEscaped = file.replace(/ /g, '\\ ').replace(/\'/g, "\\'");
    return function (callback) {
      var commands = [
        'cd ' + source,
        'rsync -azt --relative ' + fileEscaped + ' ' + destination
      ]
      console.log(chalk.green('Starting:'), file);
      var rsync = exec(commands.join(';'), function () {
        console.log(chalk.red('Done:'), file);
        callback(null);
      });
    };
  };

  return lodash(files).map(generateToken).value();
};

function print (lines) {
  lines = Array.prototype.slice.call(arguments, 0);
  console.log('');
  lodash.each(lodash.flatten(lines), function (line) {
    console.log(line);
  });

};

function getHomePath () {
  return process.env[(process.platform == 'win32') ? 'USERPROFILE' : 'HOME']
}



module.exports = rsync_parallel;
