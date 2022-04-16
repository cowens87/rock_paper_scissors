class Api::V1::PlaceSearchController < ApplicationController
  def place_search_request
    render json: PlaceSearchFacade.place_search(params[:title], params[:location])
  end
end
