'use strict'

angular.module 'appToolApp'
.config ($stateProvider) ->
    $stateProvider
    .state 'main',
        parent: 'root'
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainCtrl'
