class Garfield::Models::Pizza < Sequel::Model
  one_to_many :pizzas_consumptions
end