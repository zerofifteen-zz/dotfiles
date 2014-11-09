module.exports = ->

  userhome = require('userhome')

  all:
    options:
      force: true

    src: [
      userhome('.dotfiles')
      '<%= config.ruby.path_rbenv.dest %>'
      '<%= config.z.path_z.dest %>'
    ]
