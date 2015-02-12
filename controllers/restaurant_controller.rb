module Reservation
  class RestaurantController < Base

    get '/register' do
      erb :register_place
    end

    post '/register' do
      @errors = check_passwords params['password1'], params['password2']
      erb "#{@errors}" if @errors ||= create_place(params['name'],
                                                   params['address'],
                                                   params['password1'])
    end

    get '/login' do
      erb :place_login
    end

    post '/login' do
      place = find_place(params['name'], params['password'])
      if place.size == 1
        session['name'] = params['name']
        erb "Hey, #{params['name']}. You logged in successfully as a place."
      else
        erb "Invalid name or password."
      end
    end

    get '/add/table' do
      erb :add_table
    end

    post '/add/table' do
      @errors = add_table params['number'], params['places']
      redirect '/add/table' unless @errors == true
      erb "The table was added successfully."
    end

    get '/list/tables' do
      @tables = list_tables
      erb :list_tables
    end

    get '/add/product' do
      erb :add_product
    end

    post '/add/product' do
      @errors = add_product params['name'], params['price'], params['weight']
      erb "#{@errors}"
    end

    get '/show/menu' do
      @menu = show_menu
      erb :show_menu
    end

    get '/find' do
    end

    helpers AuthenticationHelper
    helpers RestaurantHelper
  end
end
