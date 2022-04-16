# require 'rack/test'
require "sinatra/namespace"
require 'json'

class ApplicationController < Sinatra::Base 
  register Sinatra::Namespace
  before do
    content_type :json
  end

  get '/find_drivable_route' do 
   response =  MapQuestService.find_route(params[:address1], params[:address2])
   
   @route = Route.new(response)
   @route.to_json
  end
end