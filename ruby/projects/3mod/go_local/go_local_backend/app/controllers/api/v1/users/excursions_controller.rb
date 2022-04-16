class Api::V1::Users::ExcursionsController < ApplicationController
  def index
    user_excursion = Excursion.where(user_id: params[:id])
    render json: ExcursionSerializer.new(user_excursion)
  end

  def create
    nearest_city = ExcursionsFacade.nearest_city(params[:excursion][:coordinates])
    excursion = Excursion.create(excursion_params.merge(nearest_city: nearest_city))
    render json: ExcursionSerializer.new(excursion), status: :created
  end

  def update
    render json: ExcursionSerializer.new(Excursion.update(params[:id], excursion_params))
  rescue ActiveRecord::RecordNotFound
    render json: { error: {} }, status: :not_found
  end

  def destroy
    Excursion.find(params[:id]).destroy
    head :no_content
  end

  private

  def excursion_params
    params.require(:excursion).permit(:title, :description, :location, :user_id, :place_id)
  end
end
