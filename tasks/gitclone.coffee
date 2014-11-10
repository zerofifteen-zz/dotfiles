module.exports = ->

  ruby_rbenv:
    options:
      directory: '<%= config.paths.ruby.rbenv %>'
      repository: 'https://github.com/sstephenson/rbenv.git'

  ruby_build:
    options:
      directory: '<%= config.paths.ruby.build %>'
      repository: 'https://github.com/sstephenson/ruby-build.git'

  theme_iterm:
    options:
      directory: '<%= config.paths.themes.iterm %>'
      repository: 'https://github.com/deepsweet/Monokai-Soda-iTerm.git'

  z:
    options:
      directory: '<%= config.paths.z %>'
      repository: 'https://github.com/rupa/z.git'
