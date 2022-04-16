class PlaceDetailsService
  class << self
    def get_place_details(place_id)
      response = conn.get('/api/v1/place_details') do |request|
        request.params['place_id'] = place_id
      end
      parse_data(response)
    end

    private

    def conn
      Faraday.new(url: 'https://go-local-maps-api.herokuapp.com')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
