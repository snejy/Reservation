module Reservation
  module RestaurantHelper

    def add_table number, places
      if check_numbers number, places
        place = Restaurant.all.last(:name => session['name'])
        table = Table.new(:number => number.to_i, :places => places.to_i)
        place.tables << table
        place.tables.save
      else
        "The number of the table and the places should be positive integers."
      end
    end

    def check_numbers number, places
      number.to_i > 0 and places.to_i >=2
    end

    def list_tables
      place = Restaurant.all(:name => session['name'])
      place.tables
    end

    def add_product name, price, weight
      place = Restaurant.all.last(:name => session['name'])
      product = Product.new(:name => name, :price => price.to_f, :weight => weight.to_i)
      place.products << product
      place.products.save
    end

    def show_menu
      place = Restaurant.all(:name => session['name'])
      place.products
    end

    def get_orders
      restaurant_id = Restaurant.all(:name => session['name'])
      Restaurant.all(:name => session['name'], :orders => Order.all)
    end

    def logout_place
      session['name'] = nil
    end

  end
end