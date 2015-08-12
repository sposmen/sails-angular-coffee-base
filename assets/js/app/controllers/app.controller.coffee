controllers = angular.module('sampleApp.controllers', [])

app = angular.module('sampleApp', [
  'sampleApp.controllers'
  'ui.router'
  'ui.bootstrap'
  'ngSails'
  'ngMap'
]);


app.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  #
  # For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise '/'
  #
  # Now set up the states
  $stateProvider.state 'home',
    url: '/'
    templateUrl: 'templates/home/index.html'

  for route in ['coworkers']
    $stateProvider.state route,
      url: "/#{route}"
      templateUrl: "templates/#{route}/list.html"
    .state "#{route}New",
      url: "/#{route}/new"
      templateUrl: "templates/#{route}/new.html"
    .state "#{route}Show",
      url: "/#{route}/{id}"
      templateUrl: "templates/#{route}/show.html"
    .state "#{route}Edit",
      url: "/#{route}/{id}/edit"
      templateUrl: "templates/#{route}/edit.html"

class ApplicationController
  constructor: (@$scope)->
    @$scope.dateParent = @dateParent
  dateParent:->
    new Date()


controllers.controller 'AppCtrl', ['$scope', ApplicationController]
