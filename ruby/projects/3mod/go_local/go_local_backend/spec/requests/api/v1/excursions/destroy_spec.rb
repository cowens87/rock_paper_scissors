require 'rails_helper'

  describe 'Excursion Destroy Endpoint' do
    it 'can delete an excursion' do 
      user = create(:user, id: 1)
      excursion = create(:excursion, user_id: user.id)

      expect(user.excursions.count).to eq(1)
      expect{ delete "/api/v1/users/#{user.id}/excursions/#{excursion.id}" }.to change(Excursion, :count).by(-1)
      expect(response).to be_successful
      expect(user.excursions.count).to eq(0)
      expect(response).to have_http_status(:no_content)
      expect{Excursion.find(excursion.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

