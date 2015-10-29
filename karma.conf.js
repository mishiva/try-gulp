// Karma configuration
// Generated on Thu Oct 29 2015 11:03:40 GMT+0300 (MSK)

// export PHANTOMJS_BIN=node_modules/phantomjs/bin/phantomjs
// var browserify = require('karma-browserify');
// var nyan = require('karma-nyan-reporter');

module.exports = function(config) {
  config.set({

    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '',


    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['browserify', 'mocha', 'chai', 'sinon'],


    // list of files / patterns to load in the browser
    files: [
      // 'app/*_test.js',
      'tests/**/*_test.js'
    ],


    // list of files to exclude
    exclude: [
    ],

    plugins: [
      // 'browserify',
      'karma-nyan-reporter',
      'karma-mocha',
      'karma-chai',
      'karma-sinon',
      'karma-phantomjs-launcher',
      'karma-chrome-launcher',
      'karma-browserify',
      'karma-babel-preprocessor'
    ],

    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      // 'app/*_test.js': ['babel', 'browserify'],
      'tests/**/*_test.js': ['browserify']
    },

    browserify: {
      debug: true,
      // plugin: [ 'babelify' ],
      transform: [ 'babelify', 'brfs' ]
      // extensions: ['.js']
    },

    client: {
      mocha: {
        reporter: 'html', // change Karma's debug.html to the mocha web reporter
        ui: 'bdd'
      }
    },

    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['nyan'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['Chrome'],
    // browsers: ['PhantomJS'],


    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: false,

    // Concurrency level
    // how many browser should be started simultanous
    concurrency: Infinity
  })
}
