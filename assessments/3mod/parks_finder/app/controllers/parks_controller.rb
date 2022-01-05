class ParksController < ApplicationController
  def index
    @parks = ParksFacade.parks_by_state(params[:state])
  end
end