'use strict'

angular.module 'appToolApp'
.config ($stateProvider) ->
    $stateProvider
    .state 'prosits',
        url: '/prosits'
        templateUrl: 'app/prosits/prosits.html'
        controller: 'PrositsCtrl'
        resolve:
          prositsPromise: ['prosits', (prosits) ->
            data = prosits.getAll()
#            console.log data.$$state.value
            return  data
          ]

    .state 'prosit',
        url: '/prosits/{id}'
        templateUrl: 'app/prosits/prosit.html'
        controller: 'PrositCtrl'
        resolve:
          prosit: ['$stateParams', 'prosits', ($stateParams, prosits) ->
            return  prosits.get($stateParams.id)
          ]
