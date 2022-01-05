class Api::V1::PlaceDetailsController < ApplicationController
  def details_request
    render json: PlaceDetailsService.get_place_details(params[:place_id])
  end
end
