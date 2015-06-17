'use strict'

describe 'Service: prosits', ->

  # load the service's module
  beforeEach module 'appToolApp'

  # instantiate service
  prosits = undefined
  beforeEach inject (_prosits_) ->
    prosits = _prosits_

  it 'should do something', ->
    expect(!!prosits).toBe true