module Reservation
  class Table
    include DataMapper::Resource

    property :id, Serial

    property :number, Integer, :required => true,
      unique: true

    property :places, Integer, :required => true

    property :available, Boolean, :default => true

    belongs_to :restaurant
  end
end