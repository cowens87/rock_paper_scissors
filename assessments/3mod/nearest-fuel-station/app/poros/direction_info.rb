class DirectionInfo
  attr_reader :name, 
              :address,
              :distance,
              :fuel_type,
              :access_times
  
  def initialize(direction_info)
    @name         = direction_info[:station_name]
    @address      = "#{direction_info[:street_address]} #{direction_info[:city]}, #{direction_info[:state]} #{direction_info[:zip]}"
    @distance     = direction_info[:distance]
    @fuel_type    = direction_info[:fuel_type_code]
    @access_times = direction_info[:access_days_time_fr]
  end
end