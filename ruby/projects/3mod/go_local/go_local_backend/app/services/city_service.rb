class CityService
  class << self
    def nearest_city(coordinates)
      response = conn.get do |req|
        req.params[:coordinates] = coordinates
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      @conn ||= Faraday.new('https://go-local-cities-api.herokuapp.com/api/v1/city')
    end
  end
end
