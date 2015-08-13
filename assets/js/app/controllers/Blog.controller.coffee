class BlogController extends BaseController
  constructor: (@$scope, @$sails, @$state, @$stateParams, @$rootScope, @$sce)->

    @modelName = 'blog'
    super
    @listParams = "?sort=title"

    # methods
    @$scope.getContent = @getContent

  updateHtml: =>
    @tinymceHtml = @$sce.trustAsHtml(@tinymce)

  getContent: =>
    @$sce.trustAsHtml(@$scope.model.content)

BlogController.$inject = [
  '$scope'
  '$sails'
  '$state'
  '$stateParams'
  '$rootScope'
  '$sce'
]

controllers.controller 'BlogCtrl', BlogController
