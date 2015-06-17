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
      return $http.put('/api/prosits/' + prosit._id,
        keywords : keywords.push keyword
      )
      .success (data) ->
          prosit.keywords.push(keyword)

    updateGeneralization: (prosit, gen) ->
      return $http.put('/api/prosits/' + prosit._id,
        generalization: gen
      )
      .success (data) ->
#          console.log(data)
          prosit.generalization = gen

  ]
