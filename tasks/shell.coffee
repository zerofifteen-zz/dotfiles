module.exports = ->

  os = require('os')

  shell = { }

  if os.platform('darwin')
    shell.osx =
      command: [
        'source <%= config.osx.path_osx %>'
      ].join('&&')
      options:
        stdout: true
        stderr: true

    shell.iterm =
      command: [
        '[ -d "/Applications/iTerm.app" ]'
        'open <%= config.themes.path_iterm %>/Monokai\\ Soda.itermcolors || echo "iTerm App is not installed"'
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

  shell.ruby =
    command: [
      'sudo gem update --system'
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
        'which brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
      ].join('&&')
      options:
        stdout: true
        stderr: true

  shell.z =
    command: 'touch <%= config.z.path_z.dest %>'
    options:
      stdout: true
      stderr: true

  return shell

# git_extras: {
#     command: '(cd /tmp && git clone --depth 1 https://github.com/visionmedia/git-extras.git && cd git-extras && sudo make install)'
# }

# vim_plugins: {
#     command: 'vim +PluginInstall +qall',
#     options: {
#         stdout: true,
#         stderr: true
#     }
# },
