@pinio.factory 'Service', ['$http', ($http) ->
  _services = []

  _sync = ()->
    $http.get("./lojas-e-servicos.json#{window.location.search}" )

  sync: _sync
  all: _services
]