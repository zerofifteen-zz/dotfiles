var path = require('path');

var resolveHome = function (file) {
  return path.resolve(process.env['HOME'], file);
};

module.exports = {
  iterm: {
    colors: resolveHome('Dropbox/Settings/Applications/iTerm/Monokai\\ Soda.itermcolors')
  }
};
