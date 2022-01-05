class ParksService
  class << self
    def call_parkdb(path, params = {})
      response = connection.get(path) do |req|
        req.params = params
        req.params[:api_key] = ENV['NPS_API_KEY']
      end
      parse_data(response)
    end

    private

    def connection
      Faraday.new('https://developer.nps.gov')
    end

    def parse_data(data)
      # JSON response is a JavaScript object that looks like a hash but instead of key/value
      # pairs they are called name/value pairs, hence the symbolize_names
      # 'null'(javascript) is the 'nil'(ruby)
      # no single quotes in JSON response (remember when building your own response)
      JSON.parse(data.body, symbolize_names: true)
    end
  end
end

