class ExcursionDetailsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
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
end
