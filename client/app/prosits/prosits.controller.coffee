'use strict'

angular.module 'appToolApp'
.controller 'PrositsCtrl', ($scope, $http, Auth, prosits, socket) ->
    $scope.Prosits = []

    $scope.isLoggedIn = Auth.isLoggedIn

    $scope.getCurrentUser = Auth.getCurrentUser
#    $scope.userPromotion = Auth.getCurrentUser().promotion

    $scope.Prosits = prosits.prosits
    socket.syncUpdates 'prosit', $scope.Prosits

    $scope.addProsit = ->
      return if $scope.newProsit is ''
      prosits.create $scope.newProsit
      $scope.newProsit = ''

    $scope.deleteProsit = (prosit) ->
      prosits.delete(prosit)

    $scope.$on '$destroy', ->
      socket.unsyncUpdates 'prosit'



.controller 'PrositCtrl', ($scope, prosit, prosits, $stateParams, socket) ->

    $scope.prosit = prosit
    socket.syncUpdates 'prosit', $scope.prosit, (event, oldItem, newItem)->
      $scope.prosit = newItem if newItem._id is $stateParams.id

    $scope.addKeyword = ->
      return if $scope.newKeyword is ''
      $scope.prosit.keywords.push (
        word: $scope.newKeyword
        definition: $scope.newDefinition
      )
      prosits.update($scope.prosit)
      .success (data) ->
        $scope.newKeyword = ''
        $scope.newDefinition = ''


    $scope.deleteKeyword = (keyword) ->
      index = $scope.prosit.keywords.indexOf(keyword)
      $scope.prosit.keywords.splice index, 1
      prosits.update($scope.prosit)

    $scope.addGeneralization = ->
      return if $scope.newGeneralization is ''
      $scope.prosit.generalization = $scope.newGeneralization

      prosits.update($scope.prosit)
      .success (data) ->
        $scope.newGeneralization = ''





