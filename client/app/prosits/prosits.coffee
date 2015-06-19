'use strict'

angular.module 'appToolApp'
.config ($stateProvider) ->
    $stateProvider
    .state 'prosits',
        parent: 'root'
        url: '/prosits'
        templateUrl: 'app/prosits/prosits.html'
        controller: 'PrositsCtrl'
        resolve:
          prositsPromise: ['prosits', (prosits) ->
            prosits.getAll()
          ]

    .state 'prosit',
        parent: 'root'
        url: '/prosits/{id}'
        templateUrl: 'app/prosits/prosit.html'
        controller: 'PrositCtrl'
        resolve:
          prosit: ['$stateParams', 'prosits', ($stateParams, prosits) ->
            prosits.get($stateParams.id)
          ]
