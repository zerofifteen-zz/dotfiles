module.exports = ->

  config:
    options:
      commit: true
      commitFiles: ['package.json']
      commitMessage: 'Release v%VERSION%'
      createTag: true
      files: ['package.json']
      push: true
      pushTo: 'origin'
      tagMessage: ''
      tagName: 'v%VERSION%'
