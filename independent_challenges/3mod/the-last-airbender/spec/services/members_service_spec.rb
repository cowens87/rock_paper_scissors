require 'rails_helper'

describe MembersService do
  context "instance methods" do
    it "can make API call to database", :vcr do
      nation = 'Fire+Nation'
      query = MembersService.call_avatardb("/api/v1/characters?affiliation=#{nation}&perPage=150&page=1")
      
      member_info = query.first
    
      expect(query).to be_an Array
      expect(member_info).to be_a Hash
      expect(member_info).to have_key :name
      expect(member_info[:name]).to be_a(String)
      expect(member_info).to have_key :enemies
      expect(member_info[:enemies]).to be_an(Array)
    end
  end
end