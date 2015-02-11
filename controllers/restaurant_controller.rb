module Reservation
  class RestaurantController < Base

    get '/' do
      user = User.create(:username => 'snejy1', :password => "password")
      @users = User.all
      erb :home
    end

  end
end
