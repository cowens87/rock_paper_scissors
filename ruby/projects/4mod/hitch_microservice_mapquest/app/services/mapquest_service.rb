class MapQuestService 
  def self.find_route(address1, address2)
    response = conn.get("/directions/v2/route") do |req|
      req.params['from'] = address1
      req.params['to'] = address2
    end
    JSON.parse(response.body, symbolize_names: true) 
  end

  def self.conn 
    connection = Faraday.new(url: "https://www.mapquestapi.com") do |req|
      req.params['key'] = ENV['MAPQUEST_KEY']
    end
  end
end