Sequel.migration do
  up do
    add_column :pizzas_consumptions, :eaten_at, DateTime, null: false
  end

  down do
    drop_column :pizzas_consumptions, :eaten_at
  end
end