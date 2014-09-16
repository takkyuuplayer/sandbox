'use strict'

###*
 # @ngdoc overview
 # @name angularWithCoffeeApp
 # @description
 # # angularWithCoffeeApp
 #
 # Main module of the application.
###
angular
  .module('angularWithCoffeeApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

