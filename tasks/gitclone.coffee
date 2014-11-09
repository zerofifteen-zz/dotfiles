module.exports = ->

  ruby_rbenv:
    options:
      directory: '<%= config.ruby.path_rbenv.src %>'
      repository: 'https://github.com/sstephenson/rbenv.git'

  ruby_build:
    options:
      directory: '<%= config.ruby.path_build %>'
      repository: 'https://github.com/sstephenson/ruby-build.git'

  theme_iterm:
    options:
      directory: '<%= config.themes.path_iterm %>'
      repository: 'https://github.com/deepsweet/Monokai-Soda-iTerm.git'

  vim_vundle:
    options:
      directory: '<%= config.vim.path_vundle %>'
      repository: 'https://github.com/gmarik/Vundle.vim.git'

  # oh_my_zsh: {
  #     options: {
  #         directory: '<%= config.zsh.path_oh_my_zsh %>',
  #         repository: 'https://github.com/robbyrussell/oh-my-zsh.git'
  #     }
  # },

  # zsh_syntax_highlighting: {
  #     options: {
  #         directory: '<%= config.zsh.path_plugin_syntax %>',
  #         repository: 'https://github.com/zsh-users/zsh-syntax-highlighting.git'
  #     }
  # }
