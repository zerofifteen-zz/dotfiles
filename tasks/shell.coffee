module.exports = ->

  os = require('os')

  shell = { }

  if os.platform() is 'darwin'
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
      'npm config set prefix \'/usr/local\''
      'sudo npm install -g n'
      'sudo n latest'
      'sudo n stable'
      'npm config set prefix \'~/.npm-packages\''
      'export PATH="$PATH:$HOME/.npm-packages/bin"'
    ].join('&&')
    options:
      stdout: true
      stderr: true

  if os.platform() is 'linux'
    shell.python =
      command: [
        'sudo apt-get install python-setuptools python-dev build-essential'
        'sudo apt-get -y update'
        'sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev'
        'cd /tmp'
        'wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.5.tar.gz'
        'tar -xvzf ruby-2.1.5.tar.gz'
        'cd ruby-2.1.5/'
        './configure --prefix=/usr/local'
        'sudo make'
        'sudo make install'

      ].join('&&')
      options:
        stdout: true
        stderr: true
        execOptions:
          maxBuffer: '1000*1024'

  shell.pip =
    command: [
      'sudo easy_install pip'
      'sudo pip install virtualenv'
      'sudo pip install virtualenvwrapper'
    ].join('&&')
    options:
      stdout: true
      stderr: true

  shell.teamocil =
    command: [
      'sudo gem install teamocil'
    ].join('&&')
    options:
      stdout: true
      stderr: true


  if os.platform() is 'darwin'
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

  # shell.z =
  #   command: 'touch <%= config.paths.z %>'
  #   options:
  #     stdout: true
  #     stderr: true

  return shell
