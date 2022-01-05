require 'rails_helper'

describe ParksService do
  context "instance methods" do
    it "can make API call to database", :vcr do
      params = {q: 'TN'}
      query = ParksService.call_parkdb('/api/v1/parks?', params)
      park_data = query[:data].first
    
      expect(query).to be_a Hash
      expect(park_data).to be_a Hash
      expect(park_data).to have_key :fullName
      expect(park_data[:fullName]).to be_a(String)
      expect(park_data).to have_key :description
      expect(park_data[:description]).to be_a(String)
    end
  end
end