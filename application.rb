require 'grape'
require 'sequel'

Sequel::Model.plugin :json_serializer

module Garfield
  module API
    require './app/api/person'
    require './app/api/pizza'
    require './app/api/pizzas_consumptions'
  end

  module Models end

  class Api < Grape::API
    format :json

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      error! e, 400
    end

    rescue_from :all
    
    def self.mountRoutes
      mount Garfield::API::Person, with: { Person: configuration[:Person_Repo] }
      mount Garfield::API::Pizza, with: { Pizza: configuration[:Pizza_Repo] }
      mount Garfield::API::Pizzas_Consumptions, with: { Pizzas_Consumptions: configuration[:Pizzas_Consumptions_Repo] }
    end
  end
end
