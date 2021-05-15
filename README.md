# Garfield

## Getting started

1. Install dependencies: `bundle install`
1. Create a postgres instance: `docker-compose up -d`
1. Migrate the database: `bundle exec rake db:migrate`
1. Seed the database: `bundle exec rake db:seed`
1. Start the webserver: `bundle exec rackup` or `bundle exec shotgun config.ru`