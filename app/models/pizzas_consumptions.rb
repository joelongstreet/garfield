class Garfield::Models::Pizzas_Consumptions < Sequel::Model
  many_to_one :pizza
  many_to_one :person

  dataset_module do
    group_and_count(:group_by_eaten_at, :eaten_at)
    order(:order_by_count, Sequel.desc(:count))
    
    def filter_by_month(month)
      where(
        Sequel[:eaten_at].extract(:month) =~ month
      )
    end

    def filter_by_year(year)
      where(
        Sequel[:eaten_at].extract(:year) =~ year
      )
    end
  end
end