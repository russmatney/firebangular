'use strict'

angular.module('firebangularApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.object =
      name: ''
      duder: ''

    myDataRef = new Firebase('https://rcxg0nng0ki.firebaseio-demo.com/')

    $scope.addToFire = ->
      myDataRef.push $scope.object

    $scope.fires = myDataRef