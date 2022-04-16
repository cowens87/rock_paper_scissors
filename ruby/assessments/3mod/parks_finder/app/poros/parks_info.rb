class ParksInfo
  attr_reader :name, 
              :hours, 
              :description, 
              :directions
  
  def initialize(park_data)
    @name        = park_data[:fullName]
    @hours       = park_data[:operatingHours][0][:standardHours]
    @description = park_data[:description]
    @directions  = park_data[:directionsInfo]
  end
end