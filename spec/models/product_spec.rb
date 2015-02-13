require 'spec_helper'

module Reservation

  describe Product do
    it 'should create products' do
      expect { Product.create(:name => "Salad",
                           :price => 5.4,
                           :weight => 300)}.to_not raise_error
    end

    it 'should belong to Restaurant' do
      restaurant = Restaurant.create(:name => "Snejana",
                           :address => 'Some address goes here.',
                           :password => '123456')
      product = Product.create(:name => "Salad",
                                :price => 5.4,
                                :weight => 300)
      restaurant.products << product
      restaurant.products.save
      expect(Product.count.to_s).to eq("1")
    end

    it 'should update name of product' do
        product = Product.all.last
        product.update(:name => "Salad Cezar")
        expect(product.name).to eq("Salad Cezar")
    end

    it 'should update price of product' do
        product = Product.all.last
        product.update(:price => 5.2)
        expect(product.price.to_s).to eq("5.2")
    end

    it 'should update weight of product' do
        product = Product.all.last
        product.update(:weight => 300)
        expect(product.weight.to_s).to eq("300")
    end
  end
end