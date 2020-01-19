# require 'bundler'

# Bundler.require

# require_rel '../app'

# ActiveRecord::Base.establish_connection({
#     adapter: 'sqlite3',
#     development: 'db/development.sqlite'
# })
require 'faker'

ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_rel '../app'