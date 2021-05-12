class Garfield::API::Person < Grape::API
  resource :people do
    get do
      Garfield::Models::Person.all
    end
  end
end