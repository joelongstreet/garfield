class Garfield::Models::Person < Sequel::Model
  one_to_many :pizzas_consumptions
end