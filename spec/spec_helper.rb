require 'rack/test'
require_relative '../my_application'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  DataMapper::setup(:default, "sqlite://#{Dir.pwd}/a_test.db")
  DataMapper.finalize
  Reservation::User.auto_migrate!
  Reservation::Restaurant.auto_migrate!
  Reservation::Table.auto_migrate!
  Reservation::Product.auto_migrate!
end

def app
  Reservation::Base
end