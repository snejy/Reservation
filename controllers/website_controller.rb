module Reservation
  class WebsiteController < Base

  get '/*' do
    erb :home  
  end

  end
end