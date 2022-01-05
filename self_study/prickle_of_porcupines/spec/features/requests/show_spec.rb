require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a Request Show Page' do
    before(:each) do
      @request1    = create(:request)
      @request2    = create(:request)
      @berry_mango = create(:boba_tea, name: 'Berry Mango')
    end
    # M-M User Story 1
    it 'I see a request with all of the request information' do
      visit request_path(@request1.id)

      within("#details-#{@request1.id}") do 
        expect(page).to have_content(@request1.status)
        expect(page).to have_content(@request1.name)
        expect(page).to have_content(@request1.address)
        expect(page).to have_content(@request1.city)
        expect(page).to have_content(@request1.state)
        expect(page).to have_content(@request1.zip)
        expect(page).to have_content(@request1.reason)
      end 
    end
    # M-M User Story 4
    it 'I see a section to Add a Tea to this Request and an input where I can search for Teas by name' do
      visit request_path(@request1.id)

      expect(page).to have_content('Add a Boba Tea!')
      expect(page).to have_content('Search for Boba Tea by Name')

      fill_in 'Search for Boba Tea by Name', with: 'Berry Mango'
      click_button 'Search'

      expect(current_path).to eq(request_path(@request1.id))
      expect(page).to have_content(@berry_mango.name)
    end
    # M-M User Story 5/6/7
    it 'I see the names Teas that match my search & a button to buy tea and submit request' do
      visit request_path(@request1.id)

      expect(page).to_not have_content('Submit Request')

      fill_in 'Search for Boba Tea by Name', with: 'Berry Mango'
      click_button 'Search'

      expect(current_path).to eq(request_path(@request1.id))
      expect(page).to have_content(@berry_mango.name)
      expect(page).to have_button('Buy Me!')

      click_button 'Buy Me!'

      expect(page).to have_content("Boba Teas Requesting to Buy:")
      within("#boba-teas-added") do 
        expect(page).to have_content("#{@berry_mango.name}")
      end 
      expect(page).to have_content('Submit Request')

      click_button 'Submit'

      expect(current_path).to eq(request_path(@request1.id))
      expect(page).to have_content('Pending')
      expect(page).to_not have_content('Search for Boba Tea by Name')
      expect(page).to have_content(@berry_mango.name)
    end
    # M-M User Story 8
    it 'I search for boba tea by name & I see any teas whose name PARTIALLY matches my search' do
      visit request_path(@request1.id)

      fill_in 'Search for Boba Tea by Name', with: 'Berry'
      click_button 'Search'

      expect(current_path).to eq(request_path(@request1.id))
      expect(page).to have_content(@berry_mango.name)
    end
    # M-M User Story 9
    it 'I search for boba tea by name & my search is case insensitive' do
      visit request_path(@request1.id)

      fill_in 'Search for Boba Tea by Name', with: 'MANGO'
      click_button 'Search'

      expect(current_path).to eq(request_path(@request1.id))
      expect(page).to have_content(@berry_mango.name)
    end
  end
end



