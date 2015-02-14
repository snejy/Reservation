module Reservation
  class ReservationController < Base
    # Only for registered users

    before '/*' do
      protected_for_users!
    end

    # search based on name
    get '/search' do
      @places = list_all_places
      erb :search
    end

    post '/search' do
      if params['place'].empty?
        @places = list_all_places
        erb :find_place
      else
        @places = search_place params['place']
        if @place != true
          erb "<p> Place with this name does not exists </p>"
        else
          erb :find_place
        end
      end
    end

    get '/reserve/:id' do
      @place = get_place params['id']
      erb :choose_table
    end

    post '/order' do
      session['time'] = DateTime.now
      @errors = reserve_table params['table_id']
      if @errors == true
        undo_reservation_after_5_minutes params['table_id']
        @table_id = params['table_id']
        @user_id = session['username']
        @place = find_place_by_table_id params['table_id']
        erb :choose_product
      else
        erb "<p>#{@errors}</p>"
      end
    end

    post '/finish' do
      @products = params['check']
      @orders = []
      @products.each do |product|
        @orders << order(product, params['table_id'], params['user_id'])
      end
      erb "<p> Your order is being processed now.</p>"
    end

    get '/logout' do
      logout
      erb :home
    end

    helpers BackgroundJobsHelper
    helpers ReservationHelper
    helpers AuthenticationHelper
  end
end