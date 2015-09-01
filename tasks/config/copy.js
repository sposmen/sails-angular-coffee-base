/**
 * Copy files and folders.
 *
 * ---------------------------------------------------------------
 *
 * # dev task config
 * Copies all directories and files, exept coffescript and less fiels, from the sails
 * assets folder into the .tmp/public directory.
 *
 * # build task config
 * Copies all directories nd files from the .tmp/public directory into a www directory.
 *
 * For usage docs see:
 * 		https://github.com/gruntjs/grunt-contrib-copy
 */
module.exports = function(grunt) {

	grunt.config.set('copy', {
		dev: {
			files: [{
				expand: true,
				cwd: './assets',
				src: ['**/*.!(coffee|less)'],
				dest: '.tmp/public'
			},{
        expand: true,
        cwd: 'bower_components',
        src: [
          'sails.io.js/dist/sails.io.js',
          'jquery/dist/jquery.min.js',
          'angular/angular.min.js',
          'angular-ui-router/release/angular-ui-router.min.js',
          'angular-sails/dist/angular-sails.min.js',
          'ngmap/build/scripts/ng-map.min.js',
          'angular-bootstrap/ui-bootstrap-tpls.min.js',
          'angular-ui-tinymce/src/tinymce.js',

          'tinymce-dist/tinymce.min.js',
          'tinymce-dist/themes/**/*',
          'tinymce-dist/skins/**/*',
          'tinymce-dist/plugins/**/*',

          'bootstrap/dist/css/bootstrap.min.css',
          'bootstrap/dist/fonts/*'
        ],
        dest: '.tmp/public/dependencies'
      }]
		},
    prod: {
      files: [{
        expand: true,
        cwd: 'bower_components/bootstrap/dist',
        src: ['fonts/*'],
        dest: '.tmp/public/'
      },{
        expand: true,
        cwd: 'bower_components/tinymce-dist',
        src: ['themes/**/*','skins/**/*','plugins/**/*' ],
        dest: '.tmp/public/min'
      }]
    },
		build: {
			files: [{
				expand: true,
				cwd: '.tmp/public',
				src: ['**/*'],
				dest: 'www'
			}]
		}
	});

	grunt.loadNpmTasks('grunt-contrib-copy');
};
