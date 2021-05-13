class Garfield::Models::Pizzas_Consumptions < Sequel::Model
  many_to_one :pizza
  many_to_one :person
end