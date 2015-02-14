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
      if @errors != true
        erb "<p>#{@errors}</p>"
      else
        erb "<p> The product was successfully added.</p>"
      end
    end

    get '/orders' do
      @orders = get_orders
      erb :show_orders
    end

    get '/logout' do
      logout_place
      erb :home
    end

    helpers AuthenticationHelper
    helpers RestaurantHelper
  end
end