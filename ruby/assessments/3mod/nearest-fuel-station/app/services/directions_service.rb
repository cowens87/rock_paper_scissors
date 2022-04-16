class DirectionsService
  class << self
    def call_stationsdb(path, params = {})
      response = connection.get(path) do |req|
        req.params = params
        req.params[:key] = ENV['MAP_QUEST_API_KEY']
      end
      parse_data(response)
    end


    private

    def connection
      Faraday.new('http://www.mapquestapi.com')
    end

    def parse_data(data)
      JSON.parse(data.body, symbolize_names: true)
    end
  end
end