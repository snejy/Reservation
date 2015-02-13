require 'spec_helper'

module Reservation

  describe Restaurant do
    it 'should create restaurants' do
      expect { Restaurant.create(:name => "Snejana",
                           :address => 'Some address goes here.',
                           :password => '123456')}.to_not raise_error
    end

    it 'should update restaurant\'s address' do
        place = Restaurant.all.last(:name => "Snejana")
        place.update(:address => "Some other address.")
        expect(Restaurant.count(:address => "Some address goes here.").to_s).to eq("0")
    end

    it 'should update restaurant\'s name' do
        place = Restaurant.all.last(:name => "Snejana")
        place.update(:name => "Someothername")
        expect(Restaurant.count(:name => "Snejana").to_s).to eq("0")
    end

    it 'should update restaurant\'s password' do
        place = Restaurant.all.last(:name => "Someothername")
        place.update(:password => "Someotherpassword")
        expect(Restaurant.count(:password => '123456').to_s).to eq("0")
    end

    it 'should not create restaurant with shorter name than 2 characters' do
        Restaurant.create(:name=> 'u', :address => "Someotheraddress", :password => "password")
        expect(Restaurant.count().to_s).to eq("1")
    end

    it 'should not create restaurant with already used name ' do
        Restaurant.create(:name=> 'Someothername', :address => "Someotheraddress", :password => "password")
        expect(Restaurant.count().to_s).to eq("1")
    end

    it 'should not create restaurant with shorter address than 10 characters' do
        Restaurant.create(:name=> 'user', :address => "address", :password => "password")
        expect(Restaurant.count().to_s).to eq("1")
    end

    it 'should not create restaurant with already used address' do
        Restaurant.create(:name=> 'Someothername', :address => "Some other address.", :password => "password")
        expect(Restaurant.count().to_s).to eq("1")
    end
  end
end