require 'spec_helper'
require './spec/models/route_spec.rb'

RSpec.describe Route do 
  describe 'Happy path can make a Route object' do 
    it "will make the Route object" do
      VCR.use_cassette('route_model_test') do 
        address1 = "3956+alcott+st+denver+co+80211"
        address2 = "1138+corona+st+denver+co+80218"

        response =  MapQuestService.find_route(address1, address2)
  
        @route = Route.new(response)
    
        check_hash_structure(@route.route, :distance, Float)
        check_hash_structure(@route.route, :legs, Array)
      end
    end
  end
  describe 'Sad path can make a Route object' do 
    it "will make the Route object with wat less data" do
      VCR.use_cassette('sad_path_route_model_test') do 
        address1 = "3956+alcott+st+denver+co+80211"
        address2 = "tokyo+japan"

        response =  MapQuestService.find_route(address1, address2)
  
        @route = Route.new(response)
    
        check_hash_structure(@route.route, :routeError, Hash)
        check_hash_structure(@route.route[:routeError], :errorCode, Integer)
      end
    end
  end
end