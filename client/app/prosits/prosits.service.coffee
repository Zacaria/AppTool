'use strict'

angular.module 'appToolApp'
.factory 'prosits', ['$http', ($http)->

    # Service logic
    # ...
    prosits: []

    # Public API here

    get: (id) ->
      return $http.get('/api/prosits/' + id).then (prosit) ->
        return prosit.data

    updateKeyword: (prosit, keyword) ->
      prosit.keywords.push keyword
      console.log prosit.keywords
      return $http.put('/api/prosits/' + prosit._id,
        keywords: prosit.keywords
      )
      .success (data) ->
        console.log data
#          prosit.keywords.push(keyword)
        prosit = data
      .error((data, status)->
        console.log data
        console.log status
      )

    updateGeneralization: (prosit, gen) ->
      return $http.put('/api/prosits/' + prosit._id,
        generalization: gen
      )
      .success (data) ->
          prosit.generalization = gen

  ]
