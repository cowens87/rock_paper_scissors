class HolidaysService
  class << self
    
    def call_api(path)
      response = connection.get(path) #in case of key, ".view...etc"
      parsed_data(response)
    end
    
    private #private methods don't get tested and connections need to be private
    
    def connection
      Faraday.new("https://date.nager.at")
    end
    
    def parsed_data(data)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end