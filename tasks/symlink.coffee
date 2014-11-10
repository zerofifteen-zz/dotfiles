module.exports = ->

  os = require('os')
  userhome = require('userhome')

  symlink = { }

  symlink.bashrc =
    dest: userhome('.bashrc')
    relativeSrc: '<%= config.paths.bash.rc %>'

  if os.platform('darwin')
    symlink.bash_profile =
      dest: userhome('.bash_profile')
      relativeSrc: '<%= config.paths.bash.profile %>'

  symlink.git_config =
    dest: userhome('.gitconfig')
    relativeSrc: '<%= config.paths.git.config %>'

  symlink.git_ignore =
    dest: userhome('.gitignore_global')
    relativeSrc: '<%= config.paths.git.ignore %>'

  symlink.ssh =
    dest: userhome('.ssh/config')
    relativeSrc: '<%= config.paths.ssh.config %>'

  symlink.ruby =
    dest: userhome('.rbenv')
    relativeSrc: '<%= config.paths.ruby.rbenv %>'

  if os.platform('darwin')
    symlink.sublime =
      dest: '/usr/local/bin/subl'
      relativeSrc: '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'

  return symlink
