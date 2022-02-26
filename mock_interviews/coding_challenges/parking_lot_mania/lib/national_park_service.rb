class NationalParkService
  attr_reader :name,
              :admission_price,
              :vehicles
  
  def initialize(name, admission_price)
    @name            = name
    @admission_price = admission_price
    @vehicles        = []
  end

  def admit_vehicle(vehicle)
    @vehicles << vehicle
  end

  def all_passengers
    @vehicles.flat_map do |vehicle|
      vehicle.passengers 
    end    
  end

   def total_revenue
    @vehicles.sum do |vehicle|
      (vehicle.num_adults * @admission_price)
    end 
  end
end