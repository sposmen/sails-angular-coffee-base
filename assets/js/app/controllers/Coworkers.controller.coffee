class CoworkersController extends BasicModelController
  constructor: (@$scope, @$sails, @$state, @$stateParams, @$rootScope)->

    @modelName = 'coworkers'
    super

    @$scope.office = {latitude: 6.209844902932365, longitude: -75.56726396083832}
    @$scope.tooltipTemplate = 'templates/coworkers/tooltip.html'
    @$scope.wfhDays = Constants.wfhDaysMap

    @$scope.setPosition = @setPosition
    @$scope.startBounce = @startBounce
    @$scope.stopBounce = @stopBounce
    @listParams = "?sort=name"

  setPosition: (event)=>
    @$scope.model.latitude = event.latLng.lat()
    @$scope.model.longitude = event.latLng.lng()

  new:=>
    @$scope.model =
      latitude: 6.236124983039287
      longitude: -75.57615280151367
      morning: new Date()
      evening: new Date()
      wfh: 2

  startBounce:(model)=>
    idx = @$scope.models.indexOf(model)
    marker = @$scope.map.markers[idx + 1] # +1: Office is included in the markers
    @$scope.route = marker.getPosition().toString() if idx isnt -1 and @$scope.models[idx].haveCar
    unless (marker.getAnimation() != null)
      marker.setAnimation(google.maps.Animation.BOUNCE)

  stopBounce:(model)=>
    idx = @$scope.models.indexOf(model)
    marker = @$scope.map.markers[idx + 1]
    if (marker.getAnimation() != null)
      marker.setAnimation(null)

CoworkersController.$inject = [
  '$scope'
  '$sails'
  '$state'
  '$stateParams'
  '$rootScope'
]

controllers.controller 'CoworkersCtrl', CoworkersController
