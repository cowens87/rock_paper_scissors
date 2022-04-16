require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe 'When I visit "/"' do
    it 'After selecting  on destination, I should see the destinations info' do
      visit root_path

      select 'Turing', from: :location

      click_button 'Find Nearest Station'
      
      expect(current_path).to eq(search_path)

      within '.station_details' do
        expect(page).to have_css('#name')
        expect(page).to have_css('#address')
        expect(page).to have_css('#fuel-type')
        expect(page).to have_css('#access-times')
      end
    end
  end
end