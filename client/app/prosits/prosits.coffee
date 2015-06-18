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
          prosit: ['$stateParams', 'prosits', ($stateParams, prosits) ->
            return  prosits.get($stateParams.id)
          ]
