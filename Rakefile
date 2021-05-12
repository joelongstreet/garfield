namespace :db do

  desc 'Migrate the database'
  task :migrate, [:version] do |t, args|
    require 'sequel/core'
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect('postgres://postgres:@localhost:5432/postgres') do |db|
      Sequel::Migrator.run(db, 'migrations', target: version)
    end
  end
end