module.exports = ->

  os = require('os')

  shell = { }

  if os.platform('darwin')
    shell.osx =
      command: [
        'source <%= config.paths.osx %>'
      ].join('&&')
      options:
        stdout: true
        stderr: true

    shell.iterm =
      command: [
        '[ -d "/Applications/iTerm.app" ]'
        'open <%= config.paths.themes.iterm %>/Monokai\\ Soda.itermcolors || echo "iTerm App is not installed"'
      ].join('&&')
      options:
        stdout: true
        stderr: true

  shell.node =
    command: [
      'sudo n latest'
      'sudo n stable'
    ].join('&&')
    options:
      stdout: true
      stderr: true

  shell.pip =
    command: [
      'sudo easy_install pip'
      'sudo pip install virtualenv'
      'sudo pip install virtualenvwrapper'
    ].join('&&')
    options:
      stdout: true
      stderr: true


  if os.platform('darwin')
    shell.brew =
      command: [
        '(which brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")'
        # 'brew doctor'
        'brew update'
        '(which git-extras || brew install git-extras)'
        '(which ngrok || brew ngrok)'
        '(which tmux || brew install tmux)'
        '(which reattach-to-user-namespace || brew install reattach-to-user-namespace)'
      ].join('&&')
      options:
        stdout: true
        stderr: true

  shell.z =
    command: 'touch <%= config.paths.z %>'
    options:
      stdout: true
      stderr: true

  return shell
