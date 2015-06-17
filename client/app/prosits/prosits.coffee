'use strict'

angular.module 'appToolApp'
.config ($stateProvider) ->
    $stateProvider
    .state 'prosits',
        url: '/prosits'
        templateUrl: 'app/prosits/prosits.html'
        controller: 'PrositsCtrl'
    .state 'prosit',
        url: '/prosits/{id}'
        templateUrl: 'app/prosits/prosit.html'
        controller: 'PrositCtrl'
        resolve:
          prosit: ['$stateParams', 'prosits', 'socket', ($stateParams, prosits, socket) ->
            prosit = prosits.get($stateParams.id)
            socket.syncUpdates 'prosit', [prosit]
            return  prosit
          ]
