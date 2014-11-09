module.exports =
  config:
    options:
      questions: [
        {
          config: 'config.osx.computername'
          default: 'munster'
          message: 'Which computer name would you like to use?'
        }
        {
          config: 'config.git.name'
          default: 'Michael Vera'
          message: 'Which Git name would you like to use?'
        }
        {
          config: 'config.git.email'
          default: 'michael@alpharunt.com'
          message: 'Which Git email would you like to use?'
        }
        {
          config: 'config.editor'
          default: 'subl -n -w'
          message: 'Which editor would you like to use?'
        }
      ]
