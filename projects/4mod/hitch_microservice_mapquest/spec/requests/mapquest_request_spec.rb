require 'spec_helper'
require 'rack/test'
require './app/controllers/application_controller'
require 'json'

RSpec.describe 'find route' do 
  include Rack::Test::Methods 

  def app 
    ApplicationController
  end

  describe 'Happy Path' do 
    it 'can find a route when it should find a route' do 
      VCR.use_cassette('request_route_happy_path') do 
        address1 = "3956+alcott+st+denver+co+80211"
        address2 = "1138+corona+st+denver+co+80218"

        get "/find_drivable_route?address1=#{address1}&address2=#{address2}"
        
        body = JSON.parse(last_response.body, symbolize_names: true)
        expect(body).to be_a(Hash)
        check_hash_structure(body[:route], :legs, Array)
      end
    end
  end
  describe 'Sad Path' do 
    it 'can find a route when it should find a route' do 
      VCR.use_cassette('request_route_sad_path') do 
        address1 = "3956+alcott+st+denver+co+80211"
        address2 = "tokyo+japan"

        get "/find_drivable_route?address1=#{address1}&address2=#{address2}"
        
        body = JSON.parse(last_response.body, symbolize_names: true)
        expect(body).to be_a(Hash)
        check_hash_structure(body[:route], :routeError, Hash)
      end
    end
  end
end