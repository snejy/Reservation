module Reservation
  class Product
    include DataMapper::Resource

    property :id, Serial

    property :name, String
    
    property :price, Float
    
    property :weight, Float

    belongs_to :restaurant

  end
end