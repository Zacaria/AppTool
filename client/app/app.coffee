'use strict'

angular.module 'appToolApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'btford.socket-io',
  'ui.router',
  'ui.bootstrap'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) ->
    $urlRouterProvider
    .otherwise ->
        url: '/404'
        templateUrl: '404.html'
#    .otherwise ($injector, $location) ->
#        $injector.invoke(['$state', ($state) ->
#          $state.go('404')
#        ])

    $stateProvider
    .state('404',
        url:'404'
        templateUrl: '404.html'
      )

    $locationProvider.html5Mode true
    $httpProvider.interceptors.push 'authInterceptor'


.factory 'authInterceptor', ($rootScope, $q, $cookieStore, $location) ->
    # Add authorization token to headers
    request: (config) ->
      config.headers = config.headers or {}
      config.headers.Authorization = 'Bearer ' + $cookieStore.get 'token' if $cookieStore.get 'token'
      config

    # Intercept 401s and redirect you to login
    responseError: (response) ->
      if response.status is 401
        $location.path '/login'
        # remove any stale tokens
        $cookieStore.remove 'token'

      $q.reject response

.run ($rootScope, $location, Auth) ->

    # Redirect to login if route requires auth and you're not logged in
    $rootScope.$on '$stateChangeStart', (event, next) ->
      Auth.isLoggedInAsync (loggedIn) ->
        $location.path "/login" if next.authenticate and not loggedIn

#    $rootScope.$on '$stateChangeError', (event, next) ->
#      event.preventDefault()
#      console.log event
#      console.log next



