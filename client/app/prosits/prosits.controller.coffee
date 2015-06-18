'use strict'

angular.module 'appToolApp'
.controller 'PrositsCtrl', ($scope, $http, socket) ->
    $scope.Prosits = []

    $http.get('/api/prosits').success (Prosits) ->
      $scope.Prosits = Prosits
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
      $scope.prosit = oldItem

    $scope.addKeyword = ->
      return if $scope.newKeyword is ''
#      $scope.prosit.keywords.push
#        word: $scope.newKeyword
#        definition: "default"

      prosits.updateKeyword($scope.prosit,
        word: $scope.newKeyword
        definition: "default"
      )
      .success (data) ->
#        $scope.prosit = data
#        $scope.prosit.keywords.push data.keywords
        $scope.newKeyword = ''


    $scope.deleteKeyword = (keyword) ->
      #TODO : delete
#      prosits.updateKeyword($scope.prosit,
#        keywords: $scope.prosit.keywords
#      )

    $scope.addGeneralization = ->
      return if $scope.newGeneralization is ''
#      $scope.prosit.generalization = $scope.newGeneralization
      prosits.updateGeneralization($scope.prosit, $scope.newGeneralization)
      .success (data) ->
        $scope.prosit.generalization = data.generalization
      $scope.newGeneralization = ''





