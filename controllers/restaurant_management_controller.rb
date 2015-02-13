module Reservation
  class ManagementController < Base
    # Only for registered places

    before '/*' do
      protected_for_places!
    end

    get '/table' do
      erb :add_table
    end

    post '/table' do
      @errors = add_table params['number'], params['places']
      redirect 'place/add/table' unless @errors == true
      erb "<p>The table was added successfully.</p>"
    end

    get '/product' do
      erb :add_product
    end

    post '/product' do
      @errors = add_product params['name'], params['price'], params['weight']
      erb "<p>#{@errors}</p>"
    end


    helpers AuthenticationHelper
    helpers RestaurantHelper
  end
end