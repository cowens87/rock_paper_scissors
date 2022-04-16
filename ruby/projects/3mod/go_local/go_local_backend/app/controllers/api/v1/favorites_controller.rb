# class Api::V1::FavoritesController < ApplicationController
#   def add_favorite
#     render json: FavoriteSerializer.new(Favorite.create(favorite_params))
#   end

#   private

#   def favorite_params
#     params.permit(:user_id, :excursion_id)
#   end
# end
