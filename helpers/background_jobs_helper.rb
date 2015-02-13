module Reservation
  module BackgroundJobsHelper

    # undo reservation if the user has not ordered in 5 minutes
    def undo_reservation_after_5_minutes id, minutes = 300
      task = Thread.new {        
        table = Table.all.last(:id => id.to_i)
        sleep(minutes)  
        table.update(:available => true)
       }
    end

    # for the next 20 minutes keeps the table not available
    def reserve_for_20_minutes id
      task = Thread.new {
      cycle = 0
      while cycle <= 12000 do        
        table = Table.all.last(:id => id.to_i)
        sleep(0.10)  
        table.update(:available => false)
        cycle += 1
      end
       }
    end

  end
end