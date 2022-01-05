require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a New Request Page' do
    before(:each) do
      @request1 = create(:request)
      @request2 = create(:request)
    end
    # M-M User Story 3
    # it 'I fail to fill in any of the fields, I see a message that I must fill in those fields' do
    #   visit new_request_path

    #   click_on 'Submit'

    #   expect(current_path).to eq(new_request_path)
    #   expect(page).to have_content("Name can't be blank")
    # end
  end
end