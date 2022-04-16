class SearchController < ApplicationController
  def index
    @stations = StationsFacade.find_nearest_station(params[:location])
    nearest_station = @stations.min {|station| station.distance}.address
    @directions = DirectionsFacade.get_directions(params[:location], nearest_station)
  end
end