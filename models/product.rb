module Reservation
  class Product
    include DataMapper::Resource

    property :id, Serial

    property :id_restaurant, Integer, :key => true

    property :name, String
    
    property :price, Float
    
    property :weight, Integer

    has n, :orders, 'Order',
      parent_key: [:id],
      child_key: [:id_product]

    belongs_to :restaurant, 'Restaurant',
      parent_key: [:id],
      child_key: [:id_restaurant]

  end
end