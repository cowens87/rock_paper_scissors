require 'rails_helper'

describe ParksFacade do
  context "instance methods" do
    it "returns parks matching selections", :vcr do
      selection = ParksFacade.parks_by_state('TN')
      parks_data = selection.first

      expect(selection).to be_an Array
      expect(parks_data.name).to be_a(String)
      expect(parks_data.directions).to be_a(String)
    end
  end
end