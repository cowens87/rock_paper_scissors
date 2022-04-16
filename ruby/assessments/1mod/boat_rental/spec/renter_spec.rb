require './lib/boat'
require './lib/renter'

RSpec.describe Renter do
  before(:each) do
    @kayak  = Boat.new(:kayak, 20) 
    @renter = Renter.new("Patrick Star", "4242424242424242") 
  end

  it 'exists' do
    expect(@renter).to be_instance_of(Renter)
    expect(@renter.name).to eq('Patrick Star')
    expect(@renter.credit_card_number).to eq("4242424242424242")
  end
end