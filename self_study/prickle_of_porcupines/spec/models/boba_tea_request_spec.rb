require 'rails_helper'

RSpec.describe BobaTeaRequest, type: :model do
  before(:each) do
    @boba_tea_request = create(:boba_tea_request)
  end 

  describe 'relationships' do
    it {should belong_to :request}
    it {should belong_to :boba_tea}
  end
end