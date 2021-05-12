require 'grape'

module Garfield
end

require './app/api/person'

class Garfield::Api < Grape::API
  format :json

  mount Garfield::Person
end

Sequel::Model.plugin :json_serializer
module Garfield::Models 
  require './app/models/person'
end