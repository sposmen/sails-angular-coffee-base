class ConfigClass
  constructor: ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $locationProvider.html5Mode(true)
    #
    # For any unmatched url, redirect to /state1
    $urlRouterProvider.otherwise '/'
    #
    # Now set up the states
    $stateProvider.state 'home',
      url: '/'
      template: JST['assets/templates/home/index.html']

    for route in ['coworkers', 'blog']
      $stateProvider.state route,
        url: "/#{route}"
        template: JST["assets/templates/#{route}/list.html"]
      .state "#{route}New",
        url: "/#{route}/new"
        template: JST["assets/templates/#{route}/new.html"]
      .state "#{route}Show",
        url: "/#{route}/{id}"
        template: JST["assets/templates/#{route}/show.html"]
      .state "#{route}Edit",
        url: "/#{route}/{id}/edit"
        template: JST["assets/templates/#{route}/edit.html"]

ConfigClass.$inject = ['$stateProvider', '$urlRouterProvider', '$locationProvider']
