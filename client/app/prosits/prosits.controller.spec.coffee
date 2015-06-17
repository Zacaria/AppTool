'use strict'

describe 'Controller: PrositsCtrl', ->

  # load the controller's module
  beforeEach module 'appToolApp'
  PrositsCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PrositsCtrl = $controller 'PrositsCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
