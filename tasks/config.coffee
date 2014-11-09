module.exports = ->

  userhome = require('userhome')

  aliases:
    path_aliases: userhome('.dotfiles/.aliases')

  bash:
    path_bashrc:
      src: userhome('.dotfiles/.bashrc')
      dest: userhome('.bashrc')
    path_bash_profile:
      src: userhome('.dotfiles/.bash_profile')
      dest: userhome('.bash_profile')

  git:
    path_gitconfig:
      src: userhome('.dotfiles/.gitconfig')
      dest: userhome('.gitconfig')
    path_gitignore:
      src: userhome('.dotfiles/.gitignore_global')
      dest: userhome('.gitignore_global')

  osx:
    path_osx: userhome('.dotfiles/.osx')

  ruby:
    path_build: userhome('.dotfiles/.rbenv/plugins/ruby-build')
    path_rbenv:
      src: userhome('.dotfiles/.rbenv')
      dest: userhome('.rbenv')

  themes:
    path_iterm: userhome('.dotfiles/themes/iterm')

  vim:
    path_vimrc:
      src: userhome('.dotfiles/.vimrc')
      dest: userhome('.vimrc')
    path_vundle: userhome('.dotfiles/.vundle')

  z:
    path_z:
      dest: userhome('.z')
