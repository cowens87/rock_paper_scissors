class AvatarsService
  class << self
    def call_avatardb(path, params = {})
      # response = connection.get(path) do |req|
      #   req.params = params
      #   req.params[:api_key] = ENV['NPS_API_KEY']
      # end
      response = connection.get(path)
      parse_data(response)
    end

    private

    def connection
      Faraday.new('https://last-airbender-api.herokuapp.com/')
    end

    def parse_data(data)
      JSON.parse(data.body, symbolize_names: true)
    end
  end
end
