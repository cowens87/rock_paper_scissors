require 'rails_helper'

RSpec.describe Teahouse, type: :model do
  before(:each) do
    @teahouse1   = create(:teahouse)
    @teahouse2   = create(:teahouse)
    @lemon_pina  = create(:boba_tea, teahouse_id: @teahouse1.id)
    @sangria     = create(:boba_tea, teahouse_id: @teahouse1.id)
    @cokie_mokie = create(:boba_tea, teahouse_id: @teahouse2.id)
  end 

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :address}
    it { should validate_presence_of :city}
    it { should validate_presence_of :state}
    it { should validate_presence_of :zip}
  end

  describe 'relationships' do
    it {should have_many :boba_teas}
  end
  # 1-M User Story 16
  describe 'Sort by number of boba teas a teahouse has' do
    it 'Can sort by the number of boba teas' do
      expect(Teahouse.sort_by_tea_count).to eq([@teahouse1, @teahouse2])
    end
  end 
end
