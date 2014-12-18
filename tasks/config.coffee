module.exports = ->

  userhome = require('userhome')

  paths:
    bash:
      rc: userhome('.dotfiles/.bashrc')
      profile: userhome('.dotfiles/.bash_profile')

    git:
      config: userhome('.dotfiles/.gitconfig')
      ignore: userhome('.dotfiles/.gitignore_global')

    osx: userhome('.dotfiles/.osx')

    ruby:
      build: userhome('.dotfiles/.rbenv/plugins/ruby-build')
      rbenv: userhome('.dotfiles/.rbenv')

    ssh:
      config: userhome('.dotfiles/.ssh/config')

    themes:
      iterm: userhome('.dotfiles/themes/iterm')

    tmux:
      config: userhome('.dotfiles/.tmux.conf')

    vim:
      rc: userhome('.dotfiles/.vimrc')
      vundle: userhome('.dotfiles/.vundle')

    z: userhome('.dotfiles/z')
