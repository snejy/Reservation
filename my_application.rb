require "rubygems"
require 'bundler'
require 'dm-migrations'
require 'sinatra/base'

module Reservation
  Bundler.require

  class Base < Sinatra::Base
    set :views, File.expand_path('../views', __FILE__)
    enable :sessions

  end
end