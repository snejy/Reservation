module Reservation
  module AuthenticationHelper
    def match_passwords password, repeated_password
      "Passwords don't match." if password != repeated_password
    end

    def short_password password
      "Password is too short." if password.length < 6
    end

    def check_passwords password, repeated_password
      match_passwords password, repeated_password or short_password password
    end

    def check_username username
      "The username you entered already exists." if User.count(:username => username) != 0
    end

    def create_user username, password
      if check_username username
        check_username username
      else
        User.create(:username => username, :password => password)
        "Account was successfully created. You can log in now."
      end
    end

    def find_user username, password
      User.all(:username => username, :password => password)
    end

    def user_logged?
      session[:username]
    end

    def place_logged?
      session[:name]
    end

    def protected_for_users!
      erb :unauthorized unless user_logged?
    end

    def protected_for_places!
      erb :unauthorized unless place_logged?
    end

    def check_place_name_and_address name, address
      "A place with the same name and address already exists." if Restaurant.count(:name => name, :address => address) != 0
    end

    def check_address_lenght address
      "The address must be more than 10 characters." if address.length < 10
    end
    def create_place name, address, password
      if check_place_name_and_address name, address
        check_place_name_and_address name, address
      elsif check_address_lenght address
        check_address_lenght address
      else
        Restaurant.create(:name => name, :address => address, :password => password)
        "The place was successfully created. You can log in now as #{name} and manage tables and menus."
      end
    end

    def logout
      session['username'] = nil
    end

    def find_place name, password
      Restaurant.all(:name => name, :password => password)
    end
  end
end