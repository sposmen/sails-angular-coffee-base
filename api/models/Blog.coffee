 # User.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/#!documentation/models

module.exports =

  migrate: 'alter'
  connection: 'mongoServer'

  attributes:
    title: 'string'
    content: 'text'

