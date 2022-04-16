require './lib/card'

RSpec.describe Card do
  before(:each) do
   @card = card = Card.new(:heart, 'Jack', 11)
  end

  it 'exists and has attributes' do
    expect(@card).to be_a_instance_of Card
    expect(@card.suit).to eq(:heart)
    expect(@card.value).to eq('Jack')
    expect(@card.rank).to eq(11)
  end
end