class ExcursionsFacade
  def self.nearest_city(coordinates)
    formatted_coords = coordinates.tr('(,)', '').split.map do |str|
      str.to_f.round(4)
    end.join
    data = CityService.nearest_city(formatted_coords)
    "#{data[:data][:attributes][:name]}, #{data[:data][:attributes][:state]}"
  end
end
