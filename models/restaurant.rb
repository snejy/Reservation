module Reservation
  class Restaurant
    include DataMapper::Resource

    property :id, Serial

    property :name, Text,
      :required => true,
      :length => 2..100,
      :unique => true,
      :messages => {
        :length => "The name of the restaurant is shorter than 2 or longer than 100 characters.",
        :unique => "A restaurant with this name already exists."
      }

    has n, :products

    has n, :tables

  end
end