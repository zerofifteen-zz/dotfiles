module.exports = ->

  userhome = require('userhome')

  all:
    options:
      force: true

    src: [
      userhome('.dotfiles')
      '<%= config.paths.ruby.rbenv %>'
      '<%= config.paths.z %>'
    ]
