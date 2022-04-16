class Api::V1::Users::FavoritesController < ApplicationController
  def index
    favorites = User.find(params[:id]).saved_excursions
    options = {}
    options[:meta] = { cities: favorites.cities }
    render json: ExcursionSerializer.new(favorites, options)
  end

  def add_favorite
    render json: FavoriteSerializer.new(Favorite.create(favorite_params))
  end

  def delete_favorite
    Favorite.find_by(user_id: params[:user_id], excursion_id: params[:excursion_id]).destroy
    head :no_content
  end

  private

  def favorite_params
    params.permit(:user_id, :excursion_id)
  end
end
