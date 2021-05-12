# Garfield

## Getting started

1. Install dependencies: `bundle install`
2. Create a postgres instance: `docker-compose up -d`
3. Migrate the database: `bundle exec rake db:migrate`
4. Start the webserver: `bundle exec rackup`