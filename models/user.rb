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

# може да се регистрираш като user
# или като място примерно ресторант
# и да се логнеш и като двете
# цял ден само това написах :Д
# сега има да пиша
# като се логнеш като място да можеш да си нарпавиш меню
# и да зададеш колко маси имаш в заведението
# да ги номерираш и на всяка една от тях да кажеш колко места има
# и после вече да може юзърти да търсят заведения, да си резервират маси и да си поръчват неща
# и да им тече време
# резервацията да важи 20 минути
# ама заведенията трябва да приемат поръчката
# и ако я откажат да върнат причина защо