require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  before(:each) do
   @card1 = Card.new(:diamond, 'Queen', 12)
   @card2 = Card.new(:spade, '3', 3)
   @card3 = Card.new(:heart, 'Ace', 14)
   @card4 = Card.new(:club, '5', 5)
   @cards = [@card1, @card2, @card3]
   @deck  = Deck.new(@cards)
  end

  it 'exists and has attributes' do
    expect(@deck).to be_a_instance_of Deck
    expect(@deck.cards).to eq([@card1, @card2, @card3])
  end
  
  it 'can find card rank by position' do
    expect(@deck.rank_of_card_at(0)).to be(12)
    expect(@deck.rank_of_card_at(2)).to be(14)
    expect(@deck.cards).to eq([@card1, @card2, @card3])
  end

  it 'can find high ranking cards' do
    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
  end

  it 'can find percent high ranking cards' do
    expect(@deck.percent_high_ranking).to eq(66.67)
  end

  it 'can remove cards' do
    @deck.remove_card 

    expect(@deck.cards).to eq([@card2, @card3])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(50)
  end
 
  it 'can add cards' do
    @deck.remove_card 
    @deck.add_card(@card4)

    expect(@deck.cards).to eq([@card2, @card3, @card4])
    expect(@deck.high_ranking_cards).to eq([@card3])
    expect(@deck.percent_high_ranking).to eq(33.33)
  end
end