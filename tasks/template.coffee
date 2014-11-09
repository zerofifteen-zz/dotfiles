module.exports = ->

  bash:
    options:
      data: '<%= config %>'

    files:
      '<%= config.bash.path_bashrc.src %>': ['templates/.bashrc']
      '<%= config.bash.path_bash_profile.src %>': ['templates/.bash_profile']

  git:
    options:
      data: '<%= config %>'

    files:
      '<%= config.git.path_gitconfig.src %>': ['templates/.gitconfig']
      '<%= config.git.path_gitignore.src %>': ['templates/.gitignore_global']

  osx:
    options:
      data: '<%= config %>'
    files:
      '<%= config.osx.path_osx %>': ['templates/.osx']

  vim:
    options:
      data: '<%= config %>'

    files:
      '<%= config.vim.path_vimrc.src %>': ['templates/.vimrc']
