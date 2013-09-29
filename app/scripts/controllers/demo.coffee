'use strict'

angular.module('firebangularApp')
  .controller 'DemoCtrl', ($scope, angularFire) ->
    chatsRef = new Firebase('https://rcxg0nng0ki.firebaseio-demo.com/')
    activitiesRef = new Firebase('https://c7davkultcc.firebaseio-demo.com/')

    angularFire(chatsRef.limit(15), $scope, "chats")
    angularFire(activitiesRef.limit(15), $scope, "activities")

    addActivity = (object) ->
      date = new Date()
      activity =
        event: "added message"
        user: object.name
        date: date.toString()
        detail: object.message
      activitiesRef.push activity

    $scope.addMessage = ->
      chatsRef.push $scope.object
      addActivity($scope.object)
      $scope.object.message = ''
