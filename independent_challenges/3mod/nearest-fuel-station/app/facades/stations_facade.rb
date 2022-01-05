class StationsFacade
  def self.find_nearest_station(starting_location)
    params = {location: starting_location }
    stations_info = StationsService.call_stationsdb("/api/alt-fuel-stations/v1/nearest.json?location", params)[:fuel_stations]
    stations_info.map { |station_info| StationInfo.new(station_info) }
  end
end