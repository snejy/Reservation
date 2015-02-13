module Reservation
  class Order
    include DataMapper::Resource

    property :id, Serial

    property :time_made, DateTime, 
      :default => DateTime.now

    property :id_restaurant, Integer, :key => true

    property :id_user, Integer, :key => true

    property :id_product, Integer, :key => true

    property :id_table, Integer, :key => true

    belongs_to :restaurant, 'Restaurant',
      parent_key: [:id],
      child_key: [:id_restaurant]

    belongs_to :user, 'User',
     parent_key: [:id],
     child_key: [:id_user]

    belongs_to :table, 'Table',
     parent_key: [:id],
     child_key: [:id_table]

    belongs_to :product, 'Product',
     parent_key: [:id],
     child_key: [:id_product]

  end
end