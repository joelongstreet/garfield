require 'dotenv/load'
require 'sequel'

DB = Sequel.connect(ENV['PG'])

require './application.rb'

use Rack::Static,
  :urls => ['/img', '/js', '/css'],
  :root => 'public'

map '/app' do
  run lambda { |env|
    [
      200, 
      {
        'Content-Type'  => 'text/html', 
        'Cache-Control' => 'public, max-age=86400' 
      },
      File.open('public/index.html', File::RDONLY)
    ]
  }
end

run Garfield::Api