require 'spec_helper'

module Reservation

  describe RestaurantHelper do
    include Reservation::RestaurantHelper

    it 'should check if numbers are greater than 0 and places greater than 2' do
      expect(check_numbers(0, 2)).to eq false
      expect(check_numbers(3, 1)).to eq false
      expect(check_numbers(3, 5)).to eq true
    end

    it 'should returns message if the numbers of the tables are not positive' do
      expect(add_table(0, 2)).to eq "The number of the table and the places should be positive integers."
      expect(add_table(5, 0)).to eq "The number of the table and the places should be positive integers."
    end
  end
end