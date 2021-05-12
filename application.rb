require 'grape'

module Garfield
end

require './app/api/person'
require './app/api/pizzas_consumptions'

class Garfield::Api < Grape::API
  format :json

  mount Garfield::Person
  mount Garfield::Pizzas_Consumptions
end

Sequel::Model.plugin :json_serializer
module Garfield::Models 
  require './app/models/person'
  require './app/models/pizzas_consumptions'
end