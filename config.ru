require 'dotenv/load'
require 'sequel'

DB = Sequel.connect(ENV['PG'])

require './application.rb'

require './app/models/person'
require './app/models/pizza'
require './app/models/pizzas_consumptions'

use Rack::Static,
  :urls => ['/img', '/js', '/css'],
  :root => 'public'

map '/app' do
  run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=86400' 
      },
      File.open('public/index.html', File::RDONLY)
    ]
  }
end

Garfield::Api.configure do |config|
  config[:Person_Repo] = Garfield::Models::Person
  config[:Pizza_Repo] = Garfield::Models::Pizza
  config[:Pizzas_Consumptions_Repo] = Garfield::Models::Pizzas_Consumptions
end

run Garfield::Api
Garfield::Api.mountRoutes