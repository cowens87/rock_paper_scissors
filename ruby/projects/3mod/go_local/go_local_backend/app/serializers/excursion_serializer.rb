class ExcursionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :location, :user_id, :place_id, :nearest_city
end
