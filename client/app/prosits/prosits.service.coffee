'use strict'

angular.module 'appToolApp'
.factory 'prosits', ['$http', ($http)->

    o =
      prosits: []

    # Service logic
    # ...


    # Public API here

    o.getAll = ->
      return $http.get('/api/prosits')
      .success (Prosits) ->
        angular.copy(Prosits, o.prosits)
      .error (data) ->
        console.log 'failed getting all prosits'
        console.log data

    o.get = (id) ->
      return $http.get('/api/prosits/' + id).then (prosit) ->
#        return prosit.data if prosit.data._id is id
        prosit.data

    o.create = (name) ->
      $http.post '/api/prosits',
        name: name

    o.delete = (prosit) ->
      $http.delete '/api/prosits/' + prosit._id

    o.update = (prosit) ->
      return $http.put('/api/prosits/' + prosit._id, prosit)
      .success (data) ->
          prosit = data
      .error((data, status)->
          console.log data
          console.log status
        )
    o
  ]
