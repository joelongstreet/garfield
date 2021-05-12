Sequel.migration do
  up do

    alter_table(:pizzas_consumptions) do
      drop_foreign_key(:pizza_id)
      drop_foreign_key(:person_id)

      add_foreign_key :pizza_id, :pizzas, on_delete: :cascade
      add_foreign_key :person_id, :people, on_delete: :cascade
    end
  end

  down do
    alter_table(:pizzas_consumptions) do
      drop_foreign_key(:pizza_id)
      drop_foreign_key(:person_id)

      add_foreign_key :pizza_id, :pizzas
      add_foreign_key :person_id, :people
    end
  end
end