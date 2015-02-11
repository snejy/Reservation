require 'rubygems'
require 'bundler'
require 'sinatra'

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
    '/' => Reservation::RestaurantController,
    '/user' => Reservation::UserController
}

PATHS.each { |path, controller| map(path) { run controller } }