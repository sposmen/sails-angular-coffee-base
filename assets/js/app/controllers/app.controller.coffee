controllers = angular.module('sampleApp.controllers', [])

app = angular.module('sampleApp', [
  'sampleApp.controllers'
  'ui.router'
  'ui.bootstrap'
  'ui.tinymce'
  'ngSails'
  'ngMap'
]);


app.config ConfigClass

class ApplicationController
  constructor: (@$scope)->
    @$scope.dateParent = @dateParent
  dateParent:->
    new Date()


controllers.controller 'AppCtrl', ['$scope', ApplicationController]
