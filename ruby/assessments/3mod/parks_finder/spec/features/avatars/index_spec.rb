require 'rails_helper'

RSpec.describe "Park Search" do
  describe 'When I select "Tennessee" from the form' do
    it 'I see the total of parks found, and for each park I see their details', :vcr do
      visit avatars_path

      expect(page).to have_css('.avatars', count: 15)
      within(first('.avatars')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.hours')
        expect(page).to have_css('.description')
        expect(page).to have_css('.directions')
      end
      expect(page).to have_content('Andrew Johnson National Historic Site')
    end
  end
end