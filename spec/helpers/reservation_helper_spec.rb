require 'spec_helper'

module Reservation

  describe ReservationHelper do
    include Reservation::ReservationHelper

    it 'should search place by name' do
      place = Restaurant.create(:name => "Unique name", :address =>"Unique address.", :password => '124578')
      expect(search_place("Unique name")[0]).to eq place
      place.destroy
    end

    it 'should list all places' do
      place = Restaurant.create(:name => "Unique name", :address =>"Unique address.", :password => '124578')
      expect(list_all_places.size).to eq 1
      place.destroy
    end

    it 'should finds place by id' do
      place = Restaurant.create(:id => 10,:name => "Unique name", :address =>"Unique address.", :password => '124578')
      expect(get_place("10")[0]).to eq place
      place.destroy
    end

    it 'should return message if trying to reserve unexisting table' do
      expect(reserve_table("1243")).to eq "Such table does not exists."
    end

    it 'should reserve table if it exists' do
      table = Table.create(:id => 111, :number => 10, :places => 5)
      place = Restaurant.create(:id => 10,:name => "Unique name", :address =>"Unique address.", :password => '124578')
      place.tables << table
      place.tables.save
      expect(reserve_table("111")).to eq true
      place.tables.destroy
      table.destroy
      place.destroy
    end

    it 'should find place by table id' do
      table = Table.create(:id => 111, :number => 10, :places => 5)
      place = Restaurant.create(:id => 10,:name => "Unique name", :address =>"Unique address.", :password => '124578')
      place.tables << table
      place.tables.save
      expect(find_place_by_table_id("111")).to eq place
      place.tables.destroy
      table.destroy
      place.destroy
    end
  end
end