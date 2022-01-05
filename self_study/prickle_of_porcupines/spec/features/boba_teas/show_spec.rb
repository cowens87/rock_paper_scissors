require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit Boba Teas Show Page' do
    before(:each) do
      @teahouse1    = create(:teahouse)
      @teahouse2    = create(:teahouse)
      @thai_boba    = create(:boba_tea, teahouse_id: @teahouse1.id)
      @cherry_berry = create(:boba_tea, teahouse_id: @teahouse2.id)
    end
    # 1-M User Story 8
    it 'I see the boba tea with that id including the attributes' do
      visit boba_tea_path(@thai_boba.id) 

      expect(page).to have_content(@thai_boba.name)
      expect(page).to have_content(@thai_boba.price)
      expect(page).to have_content(@thai_boba.base)
      expect(page).to have_content(@thai_boba.caffeinated)
      expect(page).to have_content(@thai_boba.description)
    end
    # 1-M User Story 10
    it 'I see a link to update that Boba tea, once I update the tea I return to the tea show page' do
      visit boba_tea_path(@cherry_berry.id) 

      expect(page).to have_content(@cherry_berry.name)
      expect(page).to have_link('Update Boba Tea')
      
      click_on 'Update Boba Tea'

      expect(current_path).to eq(edit_boba_tea_path(@cherry_berry.id))

      fill_in 'Price:', with: 8.63
      click_on 'Submit'

      expect(current_path).to eq(boba_tea_path(@cherry_berry.id))
      expect(page).to have_content(8.63)
    end
    # 1-M User Story 11
    it 'I see a link to delete the boba tea, once deleted returns to index page' do
      visit boba_tea_path(@cherry_berry.id) 
      
      expect(page).to have_link('Delete Boba Tea')
      
      click_on 'Delete Boba Tea'
      
      expect(current_path).to eq(boba_teas_path)
      expect(page).to_not have_content(@cherry_berry.name)
    end
  end 
end