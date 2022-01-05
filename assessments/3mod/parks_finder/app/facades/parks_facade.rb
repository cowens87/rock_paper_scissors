class ParksFacade
  def self.parks_by_state(state)
    params = {q: state}
    parks_info = ParksService.call_parkdb('/api/v1/parks?', params)[:data]
    parks_info.map { |park_info| ParksInfo.new(park_info) }
  end
end