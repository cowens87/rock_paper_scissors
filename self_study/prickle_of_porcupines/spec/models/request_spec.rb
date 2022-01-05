require 'rails_helper'

RSpec.describe Request, type: :model do
  before(:each) do
    @request = create(:request)
  end 

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :address}
    it { should validate_presence_of :city}
    it { should validate_presence_of :state}
    it { should validate_presence_of :zip}
    it { should validate_presence_of :reason}
  end

  describe 'relationships' do
    it {should have_many :boba_tea_requests}
    it {should have_many(:boba_teas).through(:boba_tea_requests)}
  end
end