class DirectionsFacade
  def self.get_directions(starting_location, to_location)
    params = {from: starting_location, to: to_location }
    directions_info = DirectionsService.call_stationsdb("/directions/v2/route?", params)
    directions_info.map { |direction_info| DirectionInfo.new(direction_info) }
  end
end