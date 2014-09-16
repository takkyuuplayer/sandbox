'use strict'

###*
 # @ngdoc function
 # @name angularWithCoffeeApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the angularWithCoffeeApp
###
angular.module('angularWithCoffeeApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
