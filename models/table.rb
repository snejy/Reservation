module Reservation
  class Table
    include DataMapper::Resource

    property :id, Serial

    property :id_restaurant, Integer, :key => true

    property :number, Integer, :required => true,
      unique: true

    property :places, Integer, :required => true

    property :available, Boolean, :default => true

    has n, :orders, 'Order',
      parent_key: [:id],
      child_key: [:id_table]

    belongs_to :restaurant, 'Restaurant',
      parent_key: [:id],
      child_key: [:id_restaurant]

  end
end