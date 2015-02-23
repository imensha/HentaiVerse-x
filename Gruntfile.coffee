module.exports = (grunt) ->

  importHTMl = (filename) ->
    "#{grunt.file.read("html/#{filename}.html").replace(/^\s+|\s+$</gm, '').replace(/\n/g, "")}"

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    concat:
      options: process: Object.create(null, data:
        get: ->
          pkg = grunt.config "pkg"
          pkg.importHTML = importHTML
          pkg
        )
      coffee:
        src: [
          "src/General/Globals.coffee"
          "src/General/Monster.coffee"
          "src/Miscellaneous/Parse.coffee"
          # Battle modules --> 
          "src/Battle/Player.coffee"
          "src/Battle/Encounter.coffee"
          # <--
          "src/General/Main.coffee"
        ]
        dest: "tmp-build/script.coffee"
      userscript:
        files:
          "builds/HentaiVerse-X.user.js": [
            "src/Meta/metadata.js"
            "tmp-build/script.js"
          ]
    coffee:
      script:
        src: "tmp-build/script.coffee"
        dest: "tmp-build/script.js"
    watch:
      options:
        interrupt: true
        atBegin: true
      all:
        files: [
          "Gruntfile.coffee"
          "package.json"
          "src/**/*"
          "html/**/*"
        ]
        tasks: "build"
    clean:
      builds: "builds"
      temp: "tmp-build"
    
  require("load-grunt-tasks") grunt

  grunt.registerTask "default", ["watch"]

  grunt.registerTask "build", [
    "concat:coffee"
    "coffee:script"
    "concat:userscript"
    "clean:temp"
  ]
