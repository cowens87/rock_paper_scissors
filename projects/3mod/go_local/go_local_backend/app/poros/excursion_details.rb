class ExcursionDetails
  attr_reader :id,
              :title,
              :description,
              :updated_at,
              :place_id,
              :nearest_city,
              :formatted_address,
              :name,
              :types,
              :phone_number,
              :website,
              :business_status,
              :opening_hours

  def initialize(json_data, excursion)
    @id = excursion.id
    # Json Data
    @place_id = json_data[:data][:attributes][:place_id]
    @formatted_address = json_data[:data][:attributes][:formatted_address]
    @name = json_data[:data][:attributes][:name]
    @types = json_data[:data][:attributes][:types]
    @phone_number = json_data[:data][:attributes][:formatted_phone_number]
    @website = json_data[:data][:attributes][:website]
    @opening_hours = json_data[:data][:attributes][:opening_hours]
    @business_status = json_data[:data][:attributes][:business_status]
    # Excursion Data
    @title = excursion.title
    @description = excursion.description
    @updated_at = excursion.updated_at
  end
end
