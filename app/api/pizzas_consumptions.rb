class Garfield::Pizzas_Consumptions < Grape::API
  resource :pizzas_consumptions do
    get do
      Garfield::Models::Pizzas_Consumptions.all
    end
  end
end