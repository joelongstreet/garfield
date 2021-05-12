class Garfield::Person < Grape::API
  resource :people do
    get do
      { name: 'Joe' }
    end
  end
end