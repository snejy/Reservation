module Reservation
  module ReservationHelper

    def search_place place
      Restaurant.all(:name => place)
    end

    def list_all_places
      Restaurant.all
    end

    def get_place id
      Restaurant.all(:id => id.to_i)
    end

    def reserve_table id
      table = Table.all(:id => id.to_i)
      if table != []
        table.update(:available => false)
      else
        "Such table does not exists."
      end
    end

    def find_place_by_table_id id
      Restaurant.all.last(:tables => Table.all.last(:id => id.to_i))
    end

    def order product, table_id, user
      place = find_place_by_table_id table_id
      table = Table.all.last(:id => table_id.to_i)
      product = Product.all.last(:id => product.to_i)
      user = User.all.last(:username => user)
      order = Order.new(:time_made => DateTime.now)
      place.orders << order
      place.orders.save
      table.orders << order
      table.orders.save
      product.orders << order
      product.orders.save
      user.orders << order
      user.orders.save
    end
  end
end
