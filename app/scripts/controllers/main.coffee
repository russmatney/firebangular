'use strict'

angular.module('firebangularApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.object =
      name: ''
      duder: ''

    $scope.fires = []

    myDataRef = new Firebase('https://rcxg0nng0ki.firebaseio-demo.com/')

    $scope.addToFire = ->
      myDataRef.push $scope.object

    myDataRef.on 'child_added', (snapshot) ->
      obj = snapshot.val()
      $scope.fires.push obj
