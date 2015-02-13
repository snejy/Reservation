require 'rubygems'
require 'bundler'

module Reservation
  Bundler.require

  class Base < Sinatra::Base
    set :views, File.expand_path('../views', __FILE__)
    enable :sessions
  end
end

Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

DataMapper.setup(:default, 'sqlite:database/test.db')
DataMapper.auto_migrate!
DataMapper.auto_upgrade!

PATHS = {
    '/' => Reservation::ReservationController,
    '/place' => Reservation::RestaurantController,
    '/place/add' => Reservation::ManagementController,
    '/user' => Reservation::UserController

}
