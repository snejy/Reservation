module Reservation
  class UserController < Base

    get '/register' do
      erb :register_user
    end

    post '/register' do
      @errors = check_passwords params['password1'], params['password2']
      erb "<p>#{@errors}</p>" if @errors ||= create_user(params['username'], params['password1'])
    end

    get '/login' do
      erb :user_login
    end

    post '/login' do
      user = find_user params['username'], params['password']
      if user.size == 1
        session['username'] = params['username']
        erb "<p>Hey, #{params['username']}. You logged in successfully.</p>"
      else
        erb "<p>Invalid username or password.</p>"
      end
    end

    get '/logout' do
      logout
      redirect :home
    end

    helpers AuthenticationHelper
  end
end