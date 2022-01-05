class StationInfo
  attr_reader :name, 
              :address,
              :distance,
              :fuel_type,
              :access_times
  
  def initialize(station_info)
    @name         = station_info[:station_name]
    @address      = "#{station_info[:street_address]} #{station_info[:city]}, #{station_info[:state]} #{station_info[:zip]}"
    @distance     = station_info[:distance]
    @fuel_type    = station_info[:fuel_type_code]
    @access_times = station_info[:access_days_time_fr]
  end
end