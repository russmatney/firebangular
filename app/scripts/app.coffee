'use strict'

angular.module('firebangularApp', ['firebase'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/demo.html'
        controller: 'DemoCtrl'
      .when '/main',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
