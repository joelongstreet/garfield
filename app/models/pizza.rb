class Garfield::Models::Pizza < Sequel::Model
  one_to_many :pizzas_consumptions

  dataset_module do
    def filter_by_type(type)
      where(:type => type)
    end
  end
end