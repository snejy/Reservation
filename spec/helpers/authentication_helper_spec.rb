require 'spec_helper'

module Reservation

  describe AuthenticationHelper do
    include Reservation::AuthenticationHelper

    it 'should check if passwords match' do
      expect(match_passwords('123456', '12345')).to eq "Passwords don't match."
      expect(match_passwords('123456', '123456')).to eq nil
    end

    it 'should check if passwords are too short' do
      expect(short_password '123456').to eq nil
      expect(short_password '12345').to eq "Password is too short."
    end

    it 'should returns message if username exists' do
      User.create(:username =>"Snejana", :password => '124354')
      expect(check_username "Snejana").to eq "The username you entered already exists."
    end

    it 'should returns nil if username does not exist' do
      expect(check_username "Samanta").to eq nil
    end

    it 'should creates user if username does not exists' do
      expect(user = create_user("samanta", '124354')).to eq "Account was successfully created. You can log in now."
      user = User.all(:username => "samanta")
      user.destroy
    end

    it 'should return message if place with the same name and address exists' do
      place = Restaurant.create(:name => "Unique name", :address =>"Unique address.", :password => '124578')
      expect( check_place_name_and_address("Unique name", "Unique address.")).to eq "A place with the same name and address already exists."
      place.destroy
    end

    it 'should create place if place with this name and address does not exist' do
      expect(create_place("Unique name", "Unique address.", '124354')).to eq "The place was successfully created. You can log in now as Unique name and manage tables and menus."
      place = Restaurant.all(:name => "Unique name")
      place.destroy
    end

    it 'should find user by name and password provided' do
      user = User.create(:username =>"Snejama", :password => '124354')
      expect(find_user("Snejama",'124354')[0]).to eq user
      user.destroy
    end

    it 'should find place by name and password' do
      place = Restaurant.create(:name => "Unique name", :address =>"Unique address.", :password => '124578')
      expect(find_place("Unique name", '124578')[0]).to eq place
      place.destroy
    end
  end
end