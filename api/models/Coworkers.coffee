 # User.coffee
 #
 # @description :: TODO: You might write a short summary of how this model works and what it represents here.
 # @docs        :: http://sailsjs.org/#!documentation/models

module.exports =

  migrate: 'alter'
  connection: 'mongoServer'

  attributes:
    email:
      type: 'email'
      required: true
      unique: true
    name: 'string'
    latitude: 'float'
    longitude: 'float'
    haveCar: 'boolean'
    morning: 'datetime'
    evening: 'datetime'
    wfh: 'integer'

