@pinio.controller 'SearchController', ['$scope', '$filter', '$http', 'Service', ($scope, $filter, $http, Service) ->
  $scope.services = []
  $scope.filters =
    districts: []
    categories: []

  Service.sync().success((data) ->
    $scope.services = data
    $scope.all_services = data
  )

  $scope.filterByDistrict = (district_id)->
    if $scope.districts[district_id]
      $scope.filters.districts.push district_id
    else
      _index = $scope.filters.districts.indexOf(district_id)
      $scope.filters.districts.splice(_index, 1);

    if !!$scope.filters.districts.length
      services = []
      angular.forEach $scope.filters.districts, (key, _i) ->
        services.push $filter('filter')($scope.all_services, { district_id: key })
      $scope.services = Array.prototype.concat.apply([], services)
    else
      $scope.services = $scope.all_services
]