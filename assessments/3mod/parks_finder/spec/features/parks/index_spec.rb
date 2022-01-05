require 'rails_helper'

# As a user,
# When I select "Tennessee" from the form,
# (Note: use the existing form)
# And click on "Find Parks",
# I see the total of parks found,
# And for each park I see:
# - full name of the park
# - description
# - direction info
# - standard hours for operation

RSpec.describe "Park Search" do
  describe 'When I select "Tennessee" from the form' do
    it 'I see the total of parks found, and for each park I see their details', :vcr do
      visit root_path

      select 'Tennessee', from: :state
      click_on 'Find Parks'

      expect(current_path).to eq(parks_path)
      expect(page).to have_content('Search Results: 15')
      expect(page).to have_css('.parks', count: 15)
      within(first('.parks')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.hours')
        expect(page).to have_css('.description')
        expect(page).to have_css('.directions')
      end
      expect(page).to have_content('Andrew Johnson National Historic Site')
    end
  end
end
