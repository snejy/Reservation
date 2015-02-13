require 'spec_helper'

module Reservation

  describe Order do
    it 'should create orders' do
      expect { Order.create()}.to_not raise_error
    end

    it 'should create orders with time' do
      expect { Order.create(:time_made => DateTime.now )}.to_not raise_error
    end
  end
end