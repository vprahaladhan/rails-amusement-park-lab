class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    message = 'Sorry. '
    message += user.tickets < attraction.tickets ? "You do not have enough tickets to ride the #{attraction.name}. " : "" 
    message += user.height < attraction.min_height ? "You are not tall enough to ride the #{attraction.name}." : ""

    if (user.tickets >= attraction.tickets && user.height >= attraction.min_height) then 
      user.update(:tickets => user.tickets - attraction.tickets)
      user.update(:nausea => user.nausea + attraction.nausea_rating)
      user.update(:happiness => user.happiness + attraction.happiness_rating)
      message = "Thanks for riding the " + attraction.name + "!"
    else
      message.strip
    end
  end
end