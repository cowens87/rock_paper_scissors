require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  before(:each) do
   @card1  = Card.new(:diamond, 'Queen', 12)
   @card2  = Card.new(:spade, '3', 3)
   @card3  = Card.new(:heart, 'Ace', 14)
   @card4  = Card.new(:club, '5', 5)
   @cards  = [@card1, @card2, @card3]
   @deck   = Deck.new(@cards)
   @player = Player.new('Clarisa', @deck)
  end

  it 'exists and has attributes' do
    expect(@player).to be_a_instance_of Player
    expect(@player.deck).to eq(@deck)
    expect(@player.name).to eq('Clarisa')
  end
  
  it 'can tell if player has lost' do
    expect(@player.has_lost?).to be false
   end

  it 'can remove cards' do
    expect(@player.deck.remove_card).to eq(@card1)
    expect(@player.has_lost?).to be false
    expect(@player.deck.remove_card).to eq(@card2)
    expect(@player.has_lost?).to be false
    expect(@player.deck.remove_card).to eq(@card3)
    expect(@player.has_lost?).to be true
    expect(@player.deck).to eq(@deck)
  end
end