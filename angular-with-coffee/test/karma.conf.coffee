# Karma configuration
# Generated on Tue Sep 16 2014 23:39:00 GMT+0000 (UTC)

module.exports = (config) ->
  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '..'


    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine']


    # list of files / patterns to load in the browser
    files: [
      "bower_components/jquery/dist/jquery.js"
      "bower_components/angular/angular.js"
      'bower_components/angular-mocks/angular-mocks.js'
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/affix.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/alert.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/button.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/carousel.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/collapse.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/dropdown.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/tab.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/transition.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/scrollspy.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/modal.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/tooltip.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/popover.js"
      "bower_components/angular-resource/angular-resource.js"
      "bower_components/angular-cookies/angular-cookies.js"
      "bower_components/angular-sanitize/angular-sanitize.js"
      "bower_components/angular-animate/angular-animate.js"
      "bower_components/angular-touch/angular-touch.js"
      "bower_components/angular-route/angular-route.js"

      'app/scripts/**/*.coffee'
      'test/mock/**/*.coffee'
      'test/spec/**/*.coffee'
    ]


    # list of files to exclude
    exclude: [
    ]


    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      '**/*.coffee': ['coffee']
    }


    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress']


    # web server port
    port: 9876


    # enable / disable colors in the output (reporters and logs)
    colors: true


    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO


    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true


    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['PhantomJS']


    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: false
