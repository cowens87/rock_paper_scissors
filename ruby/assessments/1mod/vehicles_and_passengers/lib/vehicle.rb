class Vehicle
  attr_reader :year,
              :make,
              :model,
              :passengers
  attr_accessor :speeding

  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @speeding = false
    @passengers = []
  end

  def speeding?
    @speeding
  end

  def speed
    @speeding = true
  end

  def add_passenger(passenger)
    @passengers << passenger
  end

  def num_adults
    @passengers.count {|passenger| passenger.adult?}
  end
end
