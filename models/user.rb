module Reservation
  class User
    include DataMapper::Resource

    property :id, Serial

    property :username, String,
      :required => true,
      :length => 6..15,
      :unique => true,
      :messages => {
        :length => "Your username should be between 6 and 15 symbols.",
        :unique => "This username is already taken."
      }

    property :password, String,
      :required => true

  end
end