require 'spec_helper'

module Reservation

  describe Table do
    it 'should create tables' do
      expect { Table.create(:number => 1,
                           :places => 4,
                           :available => true)}.to_not raise_error
    end

    it 'should create available tables by default' do
      expect { Table.create(:number => 2,
                           :places => 4)}.to_not raise_error
    end

    it 'should create tables who are not available by default' do
      table = Table.create(:number => 3, :places => 4, :available => false )
      expect(table.available.to_s).to eq("false")
    end

    it 'should not save tables that does not belog to Restaurant' do
      restaurant = Restaurant.create(:name => "Snejana",
                           :address => 'Some address goes here.',
                           :password => '123456')
      table = Table.create(:number => 1, :places => 4, :available => false )
      restaurant.tables << table
      restaurant.tables.save
      expect(Table.count(:number => 1).to_s).to eq("1")
    end

    it 'should not create tables with the same number' do
      restaurant = Restaurant.all.last(:name => "Snejana")
      table = Table.create(:number => 1, :places => 4, :available => false )
      restaurant.tables << table
      restaurant.tables.save
      expect(Table.count(:number => 1).to_s).to eq("1")
    end

  end
end