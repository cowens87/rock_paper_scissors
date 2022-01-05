class Carnival
  attr_reader :name, :rides, :attendees
  def initialize(name)
    @name      = name
    @rides     = []
    @attendees = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def recommend_rides(attendee)
    @rides.select do |ride|
      attendee.has_interest?(ride.name)
    end
  end

  def admit(attendee)
    @attendees << attendee
  end

  def attendees_by_ride_interest
    by_ride = {}

    @rides.each do |ride|
      by_ride[ride] = []
      @attendees.each do |attendee|
        by_ride[ride] << attendee if attendee.has_interest?(ride.name)
      end
    end
    by_ride
  end
end