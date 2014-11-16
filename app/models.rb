require 'sequel'
require 'logger'

$console = Logger.new STDOUT
DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/checkout',logger: $console)

DB.sql_log_level = :debug
Sequel::Model.plugin :timestamps

require 'models/bidder'
require 'models/item'
require 'models/purchase'
