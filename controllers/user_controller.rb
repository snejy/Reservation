module Reservation
  class UserController < Base

    get '/register' do
      erb :register  
    end

    post '/register' do
      username = params['username']
      pass1 = params['password1']
      pass2 = params['password2']
      erb "username #{username}, password1 #{pass1} password2 #{pass2}"
    end
  end
end