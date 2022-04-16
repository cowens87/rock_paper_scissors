class Dock
  attr_reader :name, :max_rental_time, :rental_log, :returns
  
  def initialize(name, max_rental_time)
    @name            = name
    @max_rental_time = max_rental_time 
    @rental_log      = {}
    @returns         = []
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    charges = { amount: 0 }
      charges[:card_number] = @rental_log[boat].credit_card_number
      if boat.hours_rented <= @max_rental_time
        charges[:amount] += (boat.price_per_hour * boat.hours_rented)
      else
        charges[:amount] += (boat.price_per_hour * max_rental_time)
      end
    charges
  end

  def log_hour
    @rental_log.keys.each { |b| b.add_hour if !@returns.include?(b) }
  end

  def revenue
    total = 0
    @rental_log.keys.each { |b| total += charge(b)[:amount] if @returns.include?(b) }
    total
  end

  def return(boat)
    @returns << boat
  end
end