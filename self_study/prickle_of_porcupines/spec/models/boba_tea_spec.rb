require 'rails_helper'

RSpec.describe BobaTea, type: :model do
  before(:each) do
    @boba_tea1 = create(:boba_tea, name: 'Apple Pie Tea', price: 8.00)
    @boba_tea2 = create(:boba_tea, name: 'Mango Tea', price: 5.00, caffeinated: false)
    @boba_tea3 = create(:boba_tea, name: 'Salted Caramel', price: 4.25)
  end 

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :price}
    it { should validate_presence_of :base}
    it { should validate_presence_of :description}
  end

  describe 'relationships' do
    it {should belong_to :teahouse}
    it {should have_many :boba_tea_requests}
    it {should have_many(:requests).through(:boba_tea_requests)}
  end
  # 1-M User Story 14
  describe 'True before false' do
    it 'Can order by true/false' do
      expect(BobaTea.true_false).to eq([@boba_tea1, @boba_tea3, @boba_tea2])
    end
  end
  # 1-M User Story 15
  describe 'Filter by Price of Tea' do
    it 'Can find boba teas over a certain price range' do
      expect(BobaTea.teas_by_price(5).count).to eq(2)
    end
  end
  # 1-M User Story 17
  describe 'Sort Teas Alphabetically' do
    it 'Can sort by alph' do
      expect(BobaTea.alpha_sort).to eq([@boba_tea1, @boba_tea2, @boba_tea3])
    end
  end
end