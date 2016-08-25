@pinio.controller 'FacetController', ['$scope', '$filter', 'Service', ($scope, $filter, Service) ->
  console.log('FacetController')
  $scope.districts: []
  $scope.categories: []

]