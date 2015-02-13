require 'spec_helper'

module Reservation

  describe Product do
    it 'should create products' do
      expect { Product.create(:name => "Salad",
                           :price => 5.4,
                           :weight => 300)}.to_not raise_error
    end
  end
end