@pinio.controller 'SearchController', ['$scope', '$http', 'Service', ($scope, $http, Service) ->
  $scope.services = []
  console.log "SearchController"

  Service.sync().success((data) ->
    $scope.services = data
  )
]