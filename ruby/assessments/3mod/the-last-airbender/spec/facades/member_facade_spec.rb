require 'rails_helper'

describe MembersFacade do
  context "instance methods" do
    it "returns parks matching selections" do
      selection = MembersFacade.members_by_nation('Fire+Nation')
      member_info = selection.first

      expect(selection).to be_an Array
      expect(member_info.name).to be_a(String)
      expect(member_info.enemies[0]).to be_a(String)
    end
  end
end