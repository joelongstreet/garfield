require 'grape'

Sequel::Model.plugin :json_serializer

module Garfield
  module API
    require './app/api/person'
    require './app/api/pizzas_consumptions'
  end

  module Models
    require './app/models/person'
    require './app/models/pizzas_consumptions'
  end

  class Api < Grape::API
    format :json
  
    mount Garfield::API::Person
    mount Garfield::API::Pizzas_Consumptions
  end
end
