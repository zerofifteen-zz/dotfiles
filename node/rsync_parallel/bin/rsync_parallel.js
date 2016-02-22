#!/usr/bin/env node

var rsync_parallel = require('../');
var commands = process.argv.slice(2);
var flags = []
var command;

for (var index = commands.length; index--; index > 0) {
  command = commands[index];

  if (/^-{1,2}\w/.test(commands[index])) {
    flags.push(command);
    commands.splice(index, 1);
  }
}

if (commands.length > 2 ) {
  console.log('Aborted -- quote your wildcard?');
  return
}

rsync_parallel(commands[0], commands[1], flags);
