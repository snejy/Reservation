require 'spec_helper'

module Reservation
  describe RestaurantController do 

    it 'should register places' do
      lambda do
        post '/register', params = {
            :name => "some place",
            :address => "some addressss",
            :password1 => "1234567",
            :password2 => "1234567",
        }
      end.should { change(Restaurant, :count).by(1) }
    end

    it "should not accept short or different passwords" do
      expect do
        post "/register", params = {
          :name => 'someplace',
          :address => "some addressss",
          :password1 => '1235',
          :password2 => '1234',
        }
      end.to change(Restaurant, :count).by(0)
    end

    it 'should not register places with the same name twice' do
      lambda do
        post '/register', params = {
            :name => "some place",
            :address => "some addressss",
            :password1 => "1234567",
            :password2 => "1234567",
        }
      end.should { change(Restaurant, :count).by(1) }
      lambda do
        post '/register', params = {
            :name => "some place",
            :address => "some addressss",
            :password1 => "1234567",
            :password2 => "1234567",
        }
      end.should { change(Restaurant, :count).by(0) } 
    end    
  end
end