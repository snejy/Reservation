require 'spec_helper'

module Reservation
  describe UserController do 

    it 'should register users' do
      lambda do
        post '/register', params = {
            :username => "someusername",
            :password1 => "1234567",
            :password2 => "1234567",
        }
      end.should { change(User, :count).by(1) }
    end

    it "should not accept short or different passwords" do
      expect do
        post "/register", params = {
          :username => "someusername",
          :password1 => "1234567",
          :password2 => "123",
        }
      end.to change(User, :count).by(0)
    end

    it 'should not register users with the same username twice' do
      lambda do
        post '/register', params = {
            :username => "someusername",
            :password1 => "1234567",
            :password2 => "1234567",
        }
      end.should { change(User, :count).by(1) }
      lambda do
        post '/register', params = {
            :username => "someusername",
            :password1 => "1234567",
            :password2 => "1234567",
        }
      end.should { change(User, :count).by(0) } 
    end    
  end
end