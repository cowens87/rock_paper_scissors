require 'spec_helper'
require 'pry'

RSpec.describe MapQuestService do 
  describe 'happy path find drivable route' do 
    it 'can find a drivable address' do 
      VCR.use_cassette('happy_path_drivable_route') do 
        address1 = "3956+alcott+st+denver+co+80211"
        address2 = "1138+corona+st+denver+co+80218"

        route = MapQuestService.find_route(address1, address2)
        
        expect(route[:route][:legs]).to be_an(Array)
      end
    end
  end
  
  describe 'sad path find drivable route' do 
    it 'can NOT find a drivable address' do 
      VCR.use_cassette('sad_path_drivable_route') do 
        address1 = "3956+alcott+st+denver+co+80211"
        address2 = "tokyo+japan"

        route = MapQuestService.find_route(address1, address2)
        
        expect(route[:info][:messages].first).to eq("We are unable to route with the given locations.")
      end
    end
  end
end