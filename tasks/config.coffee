module.exports = ->

  userhome = require('userhome')

  paths:
    bash:
      rc: userhome('.dotfiles/.bashrc')
      profile: userhome('.dotfiles/.bash_profile')

    git:
      config: userhome('.dotfiles/.gitconfig')
      ignore: userhome('.dotfiles/.gitignore_global')

    hg:
      # config: userhome('.dotfiles/.gitconfig')
      ignore: userhome('.dotfiles/.hgignore_global')

    osx: userhome('.dotfiles/.osx')

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
