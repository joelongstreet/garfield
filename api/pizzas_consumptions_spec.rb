require 'grape'

module Garfield
  module API
    require './app/api/pizzas_consumptions'
  end

  class Api < Grape::API
    format :json

    mount Garfield::API::Pizzas_Consumptions
  end
end

run Garfield::Api

RSpect.describe Garfield::API::Pizzas_Consumptions, '/count-by-day' do
  it 'does someting' do
    expect(4).to eq 4
  end
end