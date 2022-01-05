require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit Boba Teas Index Page' do
    before(:each) do
      @teahouse1    = create(:teahouse)
      @teahouse2    = create(:teahouse)
      @thai_boba    = create(:boba_tea, name: 'Thai Bay', price: 4.35, teahouse_id: @teahouse1.id)
      @cherry_berry = create(:boba_tea, name: 'Cherry Berry', price: 8.50, caffeinated: 'no', teahouse_id: @teahouse2.id)
    end
    # 1-M User Story 6
    it 'I see each Boba tea in the system including the attributes' do
      visit boba_teas_path 

      expect(page).to have_content(@thai_boba.name)
      expect(page).to have_content(@thai_boba.price)
      expect(page).to have_content(@thai_boba.base)
      expect(page).to have_content(@thai_boba.caffeinated)
      expect(page).to have_content(@thai_boba.description)
      expect(page).to have_content(@cherry_berry.name)
      expect(page).to have_content(@cherry_berry.price)
      expect(page).to have_content(@cherry_berry.base)
      expect(page).to have_content(@cherry_berry.caffeinated)
      expect(page).to have_content(@cherry_berry.description)
    end
    # 1-M User Story 14
    it 'I see the records that have a `true` above/before the records that have a false' do
      visit boba_teas_path
      
      expect(@thai_boba.name).to appear_before(@cherry_berry.name)
      expect(@cherry_berry.name).to_not appear_before(@thai_boba.name)
    end
    # 1-M User Story 15
    it 'I see a form that allows me to input and filter by a number value' do
      visit boba_teas_path
      
      expect(page).to have_content(@thai_boba.name)
      expect(page).to have_content(@cherry_berry.name)

      fill_in 'Teas with price greater than:', with: '7'
      click_button 'Go'

      expect(page).not_to have_content(@thai_boba.name)
      expect(page).to have_content(@cherry_berry.name)
    end
    # 1-M User Story 20
    it 'Next to every boba tea, I see a link to edit that boba teas info' do
      visit boba_teas_path

      expect(page).to have_link("Update #{@cherry_berry.name}")
           
      click_link "Update #{@cherry_berry.name}"

      expect(current_path).to eq(edit_boba_tea_path(@cherry_berry))

      fill_in 'Base:', with: 'Black Tea'
      click_on 'Submit'

      expect(page).to have_content('Black Tea')
    end
    # 1-M User Story 21
    it 'Next to every boba tea, I see a link to delete that boba tea' do
      visit boba_teas_path

      expect(page).to have_link("Delete #{@cherry_berry.name}")
           
      click_link "Delete #{@cherry_berry.name}"

      expect(current_path).to eq(boba_teas_path)
      expect(page).to_not have_content(@cherry_berry.name)
    end
    # 1-M User Story 23
    it 'I click on the name of a boba tea anywhere on the site and I go to that boba teas show page' do
      visit boba_teas_path

      expect(page).to have_link("#{@thai_boba.name}")
           
      click_link "#{@thai_boba.name}"

      expect(current_path).to eq(boba_tea_path(@thai_boba.id))
    end
    # M-M User Story 2
    it 'I see the link to start an application' do
      visit boba_teas_path

      expect(page).to have_link("Start A Request")
      
      click_link "Start A Request"
      
      expect(current_path).to eq(new_request_path)
      
      fill_in 'Name:',           with: 'Nunu Manono'
      fill_in 'Street Address:', with: '555 W All Tea Way'
      fill_in 'City:',           with: 'Las Vegas'
      fill_in 'State:',          with: 'NV'
      fill_in 'Zip:',            with: '51006'
      fill_in 'Reason:',         with: 'I want to add more boba flavors to my menu'

      click_on 'Submit'

      request = Request.last

      expect(current_path).to eq(request_path(request.id))
      expect(page).to have_content(request.name)
      expect(page).to have_content(request.address)
      expect(page).to have_content(request.city)
      expect(request.status).to eq('In Progress')
    end
  end 
end