module.exports = ->

  bash:
    options:
      data: '<%= config %>'

    files:
      '<%= config.paths.bash.rc %>': ['templates/.bashrc']
      '<%= config.paths.bash.profile %>': ['templates/.bash_profile']

  git:
    options:
      data: '<%= config %>'

    files:
      '<%= config.paths.git.config %>': ['templates/.gitconfig']
      '<%= config.paths.git.ignore %>': ['templates/.gitignore_global']

  osx:
    options:
      data: '<%= config %>'
    files:
      '<%= config.paths.osx %>': ['templates/.osx']

  ssh:
    options:
      data: '<%= config %>'
    files:
      '<%= config.paths.ssh.config %>': ['templates/.ssh/config']

  vim:
    options:
      data: '<%= config %>'

    files:
      '<%= config.paths.vim.rc %>': ['templates/.vimrc']
