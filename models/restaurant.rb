module Reservation
  class Restaurant
    include DataMapper::Resource

    property :id, Serial

    property :name, Text,
      :key => true,
      :required => true,
      :length => 2..100,
      :unique => true,
      :messages => {
        :length => "The name of the restaurant is shorter than 2 or longer than 100 characters.",
        :unique => "A restaurant with this name already exists."
      }

    property :password, String, :required => true

    property :address, String, :required => true,
     :key => true,
     :length => 10..100,
     :unique => true,
     :messages => {
        :length => "The address of the restaurant is shorter than 10 or longer than 100 characters.",
        :unique => "A restaurant with this address already exists."
     }

    has n, :products, 'Product',
      parent_key: [:id],
      child_key: [:id_restaurant]

    has n, :tables, 'Table',
      parent_key: [:id],
      child_key: [:id_restaurant]

    has n, :orders, 'Order',
      parent_key: [:id],
      child_key: [:id_restaurant]

  end
end