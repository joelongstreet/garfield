Sequel.migration do
  up do
    create_table(:people) do
      primary_key :id
      String :name, null: false
    end

    create_table(:pizzas) do
      primary_key :id
      String :type, null: false
    end

    create_table(:pizzas_consumptions) do
      primary_key :id
      foreign_key :pizza_id, :pizzas
      foreign_key :person_id, :people
    end
  end

  down do
    drop_table(:pizzas_consumptions)
    drop_table(:people)
    drop_table(:pizzas)
  end
end