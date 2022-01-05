require 'rails_helper'

RSpec.describe 'As an user', type: :feature do
  describe "When I Select 'Fire Nation' from the select field" do
    it 'I should see the total number of people who live there & a list for first 25 members with their info' do
      visit root_path

      select 'Fire Nation', from: :nation
      click_on 'Search For Members'

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Total No. Members: 97')
      expect(page).to have_css('.par_members', count: 25)
      within(first('.par_members')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.image')
        expect(page).to have_css('.allies')
        expect(page).to have_css('.enemies')
        expect(page).to have_css('.affiliations')
      end
      expect(page).to have_content('Fire Nation train engineer')
    end
  end
end