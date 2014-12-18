'use strict';

module.exports = (grunt) ->
  path = require('path')

  require('load-grunt-config')(grunt,
    init: true
    configPath: path.join(process.cwd(), 'tasks')
  )

  grunt.task.registerTask('banner', ->
      console.log(grunt.file.read('templates/.banner'))
  )

  grunt.registerTask('setup', [
    'banner'
    'prompt'
    'clean'
    'copy'
    'template'
    'gitclone'
    'symlink'
    'shell'
  ]);

  grunt.registerTask('setup-templates', [
    'banner'
    'prompt'
    'template'
    'symlink'
  ]);
