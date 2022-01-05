require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit Teahouse Show Page' do
    before(:each) do
      @teahouse1 = create(:teahouse)
      @teahouse2 = create(:teahouse)
    end
    # 1-M User Story 2
    it 'I see the teahouse with that id and their attributes' do
      visit teahouse_path(@teahouse1.id)

      expect(page).to have_content(@teahouse1.name)
      expect(page).to have_content(@teahouse1.address)
      expect(page).to have_content(@teahouse1.city)
      expect(page).to have_content(@teahouse1.state)
      expect(page).to have_content(@teahouse1.zip)
    end
    # 1-M User Story 4
    # it 'I see a link to edit the teahouse info and once edited returns to the show page' do
    #   visit teahouse_path(@teahouse1.id)

    #   expect(page).to have_content(@teahouse1.address)
    #   expect(page).to have_link('Update Teahouse')
      
    #   click_on 'Update Teahouse'

    #   expect(current_path).to eq(edit_teahouse_path(@teahouse1.id))

    #   fill_in 'Address:', with: "1234 Boba Tea Lane"
    #   click_on 'Submit'

    #   expect(current_path).to eq(teahouse_path(@teahouse1.id))
    #   expect(page).to have_content("1234 Boba Tea Lane")
    # end
    # 1-M User Story 5
    # it 'I see a link to delete the teahouse and all related chilren, once deleted returns to index page' do
    #   visit teahouse_path(@teahouse1.id)

    #   expect(page).to have_link('Delete Teahouse')
      
    #   click_on 'Delete Teahouse'

    #   expect(current_path).to eq(teahouses_path)
    #   expect(page).to_not have_content(@teahouse1.name)
    # end
        # 1-M User Story 24
    it 'I visit any page on the site I see a link at the top of the page to the Boba_tea Index' do
      visit teahouse_path(@teahouse1.id)

      expect(page).to have_link("List of Boba Teas")
           
      click_link "List of Boba Teas"

      expect(current_path).to eq(boba_teas_path)
    end
    # 1-M User Story 25
    it 'I visit any page on the site I see a link at the top of the page to the Teahouse Index' do
      visit teahouse_path(@teahouse1.id)

      expect(page).to have_link("List of Teahouses")
           
      click_link "List of Teahouses"

      expect(current_path).to eq(teahouses_path)
    end
    # 1-M User Story 26
    it 'I see a link to take me to their list of boba teas page' do
      visit teahouse_path(@teahouse1.id)

      expect(page).to have_link("#{@teahouse1.name} Boba Teas")
           
      click_link "#{@teahouse1.name} Boba Teas"

      expect(current_path).to eq(teahouse_boba_teas_path(@teahouse1.id))
    end
  end
end