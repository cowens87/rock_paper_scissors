require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit Teahouses Index Page' do
    before(:each) do
      @teahouse1    = create(:teahouse, name: 'Garden Teahouse')
      @teahouse2    = create(:teahouse)
      @thai_boba    = create(:boba_tea, teahouse_id: @teahouse1.id)
      @cherry_berry = create(:boba_tea, teahouse_id: @teahouse2.id)
      @bananamo     = create(:boba_tea, teahouse_id: @teahouse2.id)
      @coquito      = create(:boba_tea, teahouse_id: @teahouse2.id)
    end
    # 1-M User Story 1
    it 'I see the name of each teahouse in the system' do
      visit teahouses_path
      
      expect(page).to have_content(@teahouse1.name)
      expect(page).to have_content(@teahouse2.name)
    end
    # 1-M User Story 3
    # it 'I see a link to create a new Teahouse, I fill out  a form and return to index page' do
    #   visit teahouses_path
      
    #   expect(page).to have_link('New Teahouse')
      
    #   click_on 'New Teahouse'

    #   expect(current_path).to eq(new_teahouse_path)

    #   fill_in 'Name:', with: "#{@teahouse1.name}"
    #   fill_in 'Address:', with: "#{@teahouse1.address}"
    #   fill_in 'City:', with: "#{@teahouse1.city}"
    #   fill_in 'State:', with: "#{@teahouse1.state}"
    #   fill_in 'Zip:', with: @teahouse1.zip

    #   click_on 'Create Teahouse'

    #   expect(current_path).to eq(teahouses_path)

    #   expect(page).to have_content("#{@teahouse1.name}")
    # end
    # 1-M User Story 16
    it 'I see a link to sort teahouses by the number of boba teas they have' do
      visit teahouses_path

      expect(page).to have_content(@teahouse1.name)
      expect(page).to have_content(@teahouse2.name)      
      expect(page).to have_link("Sort by Number of Boba Teas")
      
      click_link "Sort by Number of Boba Teas"

      expect(@teahouse1.name).to_not appear_before(@teahouse2.name)
      expect(@teahouse2.name).to appear_before(@teahouse1.name)
    end
    # 1-M User Story 18
    # it 'Next to every teahouse, I see a link to edit that teahouses info' do
    #   visit teahouses_path

    #   expect(page).to have_link("Update #{@teahouse1.name}")
           
    #   click_link "Update #{@teahouse1.name}"

    #   expect(current_path).to eq(edit_teahouse_path(@teahouse1.id))

    #   fill_in 'Address:', with: "800 S Bubble Tea Way"
    #   click_on 'Submit'

    #   expect(page).to have_content("800 S Bubble Tea Way")
    # end
    # 1-M User Story 19
    it 'Next to every teahouse, I see a link to delete that teahouse' do
      visit teahouses_path

      expect(page).to have_link("Delete #{@teahouse1.name}")
           
      click_link "Delete #{@teahouse1.name}"

      expect(current_path).to eq(teahouses_path)
      expect(page).to_not have_content(@teahouse1.name)
    end
    # 1-M User Story 22
    it 'I click on the name of a teahouse anywhere on the site and I go to that Teahouses show page' do
      visit teahouses_path

      expect(page).to have_link("#{@teahouse1.name}")
           
      click_link "#{@teahouse1.name}"

      expect(current_path).to eq(teahouse_path(@teahouse1.id))
    end
    # 1-M User Story 27
    it 'I see a text box to filter results by keyword that is an exact match' do
      visit teahouses_path

      expect(page).to have_content('Exact Match')
      expect(page).to have_content(@teahouse1.name)
      expect(page).to have_content(@teahouse2.name)
           
      fill_in 'Exact Match', with: @teahouse1.name
      click_on 'Search'

      expect(page).to have_content(@teahouse1.name)
      expect(page).to_not have_content(@teahouse2.name)
    end
    # 1-M User Story 28
    it 'I see a text box to filter results by keyword that is an partial match' do
      visit teahouses_path

      expect(page).to have_content('Partial Match')
      expect(page).to have_content(@teahouse1.name)
      expect(page).to have_content(@teahouse2.name)
           
      fill_in 'Partial Match', with: 'Garden'
      click_on 'Search Partial'

      expect(page).to have_content(@teahouse1.name)
      expect(page).to_not have_content(@teahouse2.name)
    end
  end
end