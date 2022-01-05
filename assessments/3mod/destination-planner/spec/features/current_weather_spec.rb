require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe 'When I visit "/"' do
    before(:each) do 
      @dest1 = Destination.create!(
        name: Faker::Address.city,
        zip: Faker::Address.zip,
        description: Faker::Lorem.sentence,
        image_url: Faker::Placeholdit.image
      )
    end

    it 'After clicking on destination, I should see the destinations info' do
      visit root_path

      click_link 'Show'
      
      expect(current_path).to eq(destination_path(@dest1))
      expect(page).to have_content(@dest1.name)
      expect(page).to have_content(@dest1.zip)
      expect(page).to have_content(@dest1.description)

      within '.current_weather' do
        expect(page).to have_css('#date')
        expect(page).to have_css('#temp-high')
        expect(page).to have_css('#temp-low')
        expect(page).to have_css('#summary')
      end
    end
  end
end