class StationsService
  class << self
    def call_stationsdb(path, params = {})
      response = connection.get(path) do |req|
        req.params = params
        req.params[:api_key] = ENV['NREL_API_KEY']
      end
      parse_data(response)
    end

    private

    def connection
      Faraday.new('https://developer.nrel.gov')
    end

    def parse_data(data)
      JSON.parse(data.body, symbolize_names: true)
    end
  end
end