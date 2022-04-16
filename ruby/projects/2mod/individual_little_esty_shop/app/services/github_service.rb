class GithubService
  class << self
    def connection
      Faraday.new('https://api.github.com')
    end

    def call_github(path, params = {})
      response = connection.get(path) do |req| 
        req.params = params 
      end
      parse_data(response)
    end

    private

    def parse_data(data)
      JSON.parse(data.body, symbolize_names: true)
    end
  end
end
