'use strict'

angular.module('firebangularApp')
  .controller 'DemoCtrl', ($scope, angularFire) ->
    chatsRef = new Firebase('https://rcxg0nng0ki.firebaseio-demo.com/')
    activitiesRef = new Firebase('https://c7davkultcc.firebaseio-demo.com/')

    angularFire(chatsRef.limit(15), $scope, "chats")
    angularFire(activitiesRef.limit(15), $scope, "activities")

    addActivity = (event, detail) ->
      date = new Date()
      activity =
        event: event
        user: $scope.userName
        date: date.toString()
        detail: detail
      activitiesRef.push activity

    $scope.addMessage = (chat) ->
      chatsRef.push {name: $scope.userName, message:chat.message}
      addActivity("added message", chat.message)
      $scope.chat.message = ''
      $scope.lockName = true

    $scope.plusOne = (chat) ->
      if chat.pluses?
        chat.pluses += 1
      else
        chat.pluses = 1
      addActivity("plus one-d", chat.message)

