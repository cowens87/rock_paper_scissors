class PlaceSearchService
  class << self
    def get_location(place_info)
      conn.get('/api/v1/place_search') do |request|
        require 'pry'; binding.pry
        request.params['location'] = place_info
      end.body
    end

    def conn
      Faraday.new(url: 'https://go-local-maps-api.herokuapp.com')
    end
  end
end
