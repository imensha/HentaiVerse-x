module.exports = (grunt) ->

    importHTMl = (filename) ->
		"#{grunt.file.read("html/#{filename}.html").replace(/^\s+|\s+$</gm, '').replace(/\n/g, "")}"

	grunt.initConfig
		pkg: grunt.file.readJSON "package.json"
		watch:
			options:
				interrupt: true
			all:
				files: [
					"Gruntfile.coffee"
					"package.json"
					"src/**/*"
					"html/**/*"
				]
		
	require("load-grunt-tasks") grunt

	grunt.registerTask "default", ["watch"]
