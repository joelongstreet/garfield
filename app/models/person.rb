class Garfield::Models::Person < Sequel::Model
  one_to_many :pizzas_consumptions

  dataset_module do
    def filter_by_name(name)
      where(:name => name)
    end
  end
end