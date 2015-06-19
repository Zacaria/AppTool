'use strict'

angular.module 'appToolApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admin',
    parent: 'root'
    url: '/admin'
    templateUrl: 'app/admin/admin.html'
    controller: 'AdminCtrl'
