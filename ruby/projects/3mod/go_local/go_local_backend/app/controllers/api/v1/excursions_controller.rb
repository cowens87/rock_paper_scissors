class Api::V1::ExcursionsController < ApplicationController
  def index
    excursions = if params[:city]
                   Excursion.where(nearest_city: params[:city])
                 else
                   Excursion.all
                 end
    options = {}
    options[:meta] = { cities: excursions.cities }
    render json: ExcursionSerializer.new(excursions, options)
  end

  def show
    excursion = Excursion.find(params[:id])
    place_details = PlaceDetailsService.get_place_details(excursion.place_id)
    excursion_details = ExcursionDetails.new(place_details, excursion)
    render json: ExcursionDetailsSerializer.new(excursion_details)
  rescue JSON::ParserError
    render json: { errors: [
      'the request could not be completed',
      'external Places API unavailable'
    ] }, status: :not_found
  end
end
