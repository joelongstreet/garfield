require 'grape'

Sequel::Model.plugin :json_serializer

module Garfield
  module API
    require './app/api/person'
    require './app/api/pizza'
    require './app/api/pizzas_consumptions'
  end

  module Models
    require './app/models/person'
    require './app/models/pizza'
    require './app/models/pizzas_consumptions'
  end

  class Api < Grape::API
    format :json

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error! e, 400
    end

    rescue_from :all
  
    mount Garfield::API::Person
    mount Garfield::API::Pizza
    mount Garfield::API::Pizzas_Consumptions
  end
end
