module.exports = ->

  os = require('os')

  symlink = { }

  symlink.bashrc =
    dest: '<%= config.bash.path_bashrc.dest %>'
    relativeSrc: '<%= config.bash.path_bashrc.src %>'

  if os.platform('darwin')
    symlink.bash_profile =
      dest: '<%= config.bash.path_bash_profile.dest %>'
      relativeSrc: '<%= config.bash.path_bash_profile.src %>'

  symlink.git_config =
    dest: '<%= config.git.path_gitconfig.dest %>'
    relativeSrc: '<%= config.git.path_gitconfig.src %>'

  symlink.git_ignore =
    dest: '<%= config.git.path_gitignore.dest %>'
    relativeSrc: '<%= config.git.path_gitignore.src %>'

  symlink.ruby =
    dest: '<%= config.ruby.path_rbenv.dest %>'
    relativeSrc: '<%= config.ruby.path_rbenv.src %>'

  if os.platform('darwin')
    symlink.sublime =
      dest: '/usr/local/bin/subl'
      relativeSrc: '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'

  return symlink
