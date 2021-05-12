require 'dotenv/load'
require 'sequel'

DB = Sequel.connect(ENV['PG'])

require './application.rb'

run Garfield::Api