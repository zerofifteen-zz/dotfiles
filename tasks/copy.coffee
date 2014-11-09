module.exports = ->

  userhome = require('userhome')

  all:
    files: [
      {
        expand: true
        cwd: 'copy/'
        src: ['**']
        dest: userhome('.dotfiles/')
      }
    ]
