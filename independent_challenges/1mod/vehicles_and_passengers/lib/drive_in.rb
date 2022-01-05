class DriveIn
  attr_reader :name,
              :parking_lot

  def initialize(name)
    @name = name
    @parking_lot = []
  end

  def park(vehicle)
    @parking_lot << vehicle
  end

  def multiple_passengers
    @parking_lot.select do |car|
      car.passengers.count > 1
    end
  end
# Made up methods
  def passengers_by_vehicle
    @parking_lot.each_with_object({}) do |vehicle, cars|
      cars[vehicle] = vehicle.passengers
    end 
  end

  def cars_with_kids
    @parking_lot.select do |vehicle|
      vehicle.passengers.any? do |passenger|
        !passenger.adult?
      end
    end 
  end
end
