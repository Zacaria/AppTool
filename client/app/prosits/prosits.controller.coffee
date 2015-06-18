'use strict'

angular.module 'appToolApp'
.controller 'PrositsCtrl', ($scope, $http, prosits, socket) ->
    $scope.Prosits = []

#    $http.get('/api/prosits').success (Prosits) ->
#      $scope.Prosits = Prosits
#      socket.syncUpdates 'prosit', $scope.Prosits
    $scope.Prosits = prosits.prosits
    socket.syncUpdates 'prosit', $scope.Prosits

    $scope.addProsit = ->
      return if $scope.newProsit is ''
      $http.post '/api/prosits',
        name: $scope.newProsit

      $scope.newProsit = ''

    $scope.deleteProsit = (prosit) ->
      $http.delete '/api/prosits/' + prosit._id

    $scope.$on '$destroy', ->
      socket.unsyncUpdates 'prosit'

.controller 'PrositCtrl', ($scope, prosit, prosits, $stateParams, socket) ->

    $scope.prosit = prosit
    socket.syncUpdates 'prosit', $scope.prosit, (event, oldItem, newItem)->
      $scope.prosit = newItem

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





