module Reservation
  class RestaurantController < Base

    get '/register' do
      erb :register_place
    end

    post '/register' do
      @errors = check_passwords params['password1'], params['password2']
      erb "<p>#{@errors}</p>" if @errors ||= create_place(params['name'],
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
        erb "<p>Hey, #{params['name']}. You logged in successfully as a place.</p>"
      else
        erb "<p>Invalid name or password.</p>"
      end
    end

    get '/logout' do
      logout_place
      erb :home
    end

    helpers AuthenticationHelper
    helpers RestaurantHelper
  end
end
