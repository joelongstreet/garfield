require 'sequel'

DB = Sequel.connect('postgres://postgres:@localhost:5432/postgres')

require './application.rb'

run Garfield::Api