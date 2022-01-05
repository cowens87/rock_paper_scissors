class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.flat_map do |unit|
      unit.renter.name unless unit.renter.nil?
  end.compact

  def average_rent
    @units.sum do |unit|
      unit.monthly_rent
    end.to_f/@units.count
  end

  def rented_units
    @units.select do |unit|
      unit.renter != nil
    end
  end

  def renter_with_highest_rent
    @units.max_by do |unit|
      unit.monthly_rent
    end.renter
  end

  def units_by_number_of_bedrooms
    units_by_num = Hash.new {|hash_obj, key| hash_obj[key] = []}
    @units.each do |unit|
      units_by_num[unit.bedrooms] << unit.number
    end
    units_by_num
  end

  def list_of_renters
    @units.select do |unit|
      unit.renter != nil
    end
  end

  def annual_breakdown
    breakdown = Hash.new {|hash_obj, key| hash_obj[key] = 0}
    list_of_renters.each do |item|
      breakdown[item.renter.name] += (item.monthly_rent * 12)
    end
    breakdown
  end

  def rooms_by_renter
    rooms = {}
    @units.each do |unit|
      if unit.renter != nil
        rooms[unit.renter] = { 
                              bathrooms: unit.bathrooms, 
                              bedrooms: unit.bedrooms
                            }
      end
    end
    rooms
  end
end
