require 'pry'
require 'date'
require 'spec_helper'
require './spec/mock_pizzas_consumptions'

describe Garfield::API do
  include Rack::Test::Methods

  def app
    Garfield::Api.configure do |config|
      config[:Pizzas_Consumptions_Repo] = Mock_Pizzas_Consumptions
    end
    Garfield::Api.mountRoutes
    Garfield::Api
  end

  after(:each) do
    Mock_Pizzas_Consumptions.mockResponse([])
  end

  context 'pizzas_consumptions' do

    context 'GET /count-by-day' do
      it 'returns a 200 when called' do
        get '/pizzas_consumptions/count-by-day'
        expect(last_response.status).to eq(200)
      end

      it 'filters by month if a month query param is passed' do
        get '/pizzas_consumptions/count-by-day?month=1'
        expect(Mock_Pizzas_Consumptions).to respond_to(:filter_by_month).with(1).argument
      end

      it 'filters by year if a year query param is passed' do
        get '/pizzas_consumptions/count-by-day?year=2012'
        expect(Mock_Pizzas_Consumptions).to respond_to(:filter_by_year).with(1).argument
      end

      it 'returns an array of hashes with count and eaten_at' do
        now = Time.now
        count = 2
        Mock_Pizzas_Consumptions.mockResponse([
          {
            eaten_at: now,
            count: count
          }
        ])
        get '/pizzas_consumptions/count-by-day'
        
        parsed = JSON.parse last_response.body
        expect(parsed.length).to eq 1
        expect(parsed[0]['count']).to eq count
      end
    end

    context 'GET /streak' do
      it 'returns a 200 when called' do
        get '/pizzas_consumptions/streak'
        expect(last_response.status).to eq(200)
      end

      it 'returns a jagged array of streaks' do
        today = Date.today

        Mock_Pizzas_Consumptions.mockResponse([
          {
            eaten_at: today.prev_day(3),
            count: 4,
          },
          {
            eaten_at: today.prev_day(2),
            count: 1,
          },
          {
            eaten_at: today.prev_day(1),
            count: 2,
          },
          {
            eaten_at: today,
            count: 2
          }
        ])

        get '/pizzas_consumptions/streak'

        parsed = JSON.parse last_response.body
        expect(parsed.length).to eq 3
        expect(parsed[1].length).to eq 2
      end
    end
  end
end