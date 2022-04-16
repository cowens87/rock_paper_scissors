class MembersService
  class << self
    def call_avatardb(path)
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
