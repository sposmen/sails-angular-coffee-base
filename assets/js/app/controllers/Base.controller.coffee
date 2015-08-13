class BaseController
  constructor: (@$scope, @$sails, @$state, @$stateParams)->
    throw Error('modelName must be specified') unless @modelName
    @$scope.models = []
    @$scope.model = {}
    @$scope.edition = false
    @$scope.getModelError = false
    @listParams = ''
    @$scope.list = @list
    @$scope.new = @new
    @$scope.create = @create
    @$scope.show = @show
    @$scope.edit = @edit
    @$scope.update = @update
    @$scope.delete = @delete

  list: =>
    @$sails.get("/api/#{@modelName}/#{@listParams}").success((data, status, headers, jwr) =>
      @$scope.models = data
    ).error (data, status, headers, jwr) ->
      alert 'Houston, we got a problem!'

  new: =>
    @$scope.model = {}

  create: =>
    @$sails.post("/api/#{@modelName}", @$scope.model).success((data, status, headers, jwr) =>
      @$state.transitionTo("#{@modelName}Show", { id: data.id } )
    ).error (data, status, headers, jwr) =>
      alert JSON.stringify data

  show: =>
    if @$stateParams.id?
      @$scope.getModelError = false
      @$scope.model = {}
      @$sails.get("/api/#{@modelName}/" + @$stateParams.id).success((data, status, headers, jwr) =>
        @$scope.model = data
      ).error (data, status, headers, jwr) =>
        @$scope.getModelError = true
        alert 'Houston, we got a problem!'
  edit: =>
    if @$stateParams.id?
      @$sails.get("/api/#{@modelName}/" + @$stateParams.id).success((data, status, headers, jwr) =>
        @$scope.edition = true
        @$scope.model = data
      ).error (data, status, headers, jwr) =>
        @$scope.getModelError = true
        alert 'Houston, we got a problem!'

  update: =>
    if @$stateParams.id?
      @$sails.put("/api/#{@modelName}/" + @$stateParams.id, @$scope.model).success((data, status, headers, jwr) =>
        @$state.transitionTo("#{@modelName}Show", { id: data.id } )
      ).error (data, status, headers, jwr) =>
        alert 'Houston, we got a problem!'

  delete: (id)=>
    if id?
      if confirm('Are you sure?')
        @$sails.delete("/api/#{@modelName}/" + id).success((data, status, headers, jwr) =>
          @$state.reload()
        ).error (data, status, headers, jwr) =>
          alert 'Houston, we got a problem!'
