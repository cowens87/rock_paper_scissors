class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :excursion_id
end
