namespace :db do
  require 'sequel/core'

  desc 'Migrate the database'
  task :migrate, [:version] do |t, args|
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect('postgres://postgres:@localhost:5432/postgres') do |db|
      Sequel::Migrator.run(db, 'migrations', target: version)
    end
  end

  desc 'Seed the database'
  task :seed do |t|
    require 'csv'

    csv_table = CSV.parse(File.read('seed.csv'), headers: true)
    peoples_names = csv_table.by_col[0].uniq
    pizzas_types = csv_table.by_col[1].uniq

    DB = Sequel.connect('postgres://postgres:@localhost:5432/postgres')
    people = DB[:people]
    pizzas = DB[:pizzas]
    pizzas_consumptions = DB[:pizzas_consumptions]

    peoples_names.each { |person_name|
      people.insert(name: person_name)
    }

    pizzas_types.each { |pizza_type|
      pizzas.insert(type: pizza_type)
    }

    csv_table.each { |row|
      person = DB[:people][{ name: row[0] }]
      pizza = DB[:pizzas][{ type: row[1] }]

      pizzas_consumptions.insert(
        pizza_id: pizza[:id],
        person_id: person[:id]
      )
    }
  end
end