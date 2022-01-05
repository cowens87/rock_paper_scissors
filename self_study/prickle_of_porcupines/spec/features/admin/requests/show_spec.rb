require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit the Admin Request Show Page' do
    before(:each) do
      @request1    = create(:request)
      @request2    = create(:request)
      @berry_mango = create(:boba_tea, name: 'Berry Mango')
    end
    # M-M User Story 10
    # it 'For every Tea that the request is for, I see a button to approve the request for that specific Tea' do
    #   visit admin_request_path(@request1.id)

    #   within("#details-#{@request1.id}") do 
    #     expect(page).to have_content(@berry_mango.name)
    #     expect(page).to have_button('Approve')

    #     click_button('Approve')

    #     expect(current_path).to eq(admin_request_path(@request1.id))
    #     expect(page).to_not have_button('Approve')
    #     expect(page).to have_content('This Tea has been approved')
    #   end 
    # end
  end
end