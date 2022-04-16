require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @card1   = Card.new(:heart, 'Jack', 11)
    @card2   = Card.new(:heart, '10', 10)
    @card3   = Card.new(:heart, '9', 9)
    @card4   = Card.new(:diamond, 'Jack', 11)
    @card5   = Card.new(:heart, '8', 8)
    @card6   = Card.new(:diamond, 'Queen', 12)
    @card7   = Card.new(:heart, '3', 3)
    @card8   = Card.new(:diamond, '2', 2)
    @deck1   = Deck.new([@card1, @card2, @card5, @card8])
    @deck2   = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn    = Turn.new(@player1, @player2)
  end

  it 'exists and has attributes' do
    expect(@turn).to be_a_instance_of Turn
    expect(@turn.player1).to eq(@player1)
    expect(@turn.player2).to eq(@player2)
  end
  # BASIC TURN
  it 'has spoils of war' do
    expect(@turn.spoils_of_war).to eq([])
  end

  it 'can determine turn type' do
    expect(@turn.type).to eq(:basic)
  end

  it 'can determine the winner' do
    winner = @turn.winner
    expect(winner).to eq(@player1)
  end

  it 'can pile cards' do
    @turn.pile_cards
    expect(@turn.spoils_of_war).to eq([@card1, @card3])
  end

  it 'can award spoils' do
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)

    expect(@player1.deck).to eq(@deck1)
    expect(@player2.deck).to eq(@deck2)
  end
  # WAR TURN
  it 'can determine turn type' do
    deck1   = Deck.new([@card1, @card2, @card5, @card8])
    deck2   = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn    = Turn.new(player1, player2)
    
    expect(turn.type).to eq(:war)
  end


  it 'can determine the winner' do
    deck1   = Deck.new([@card1, @card2, @card5, @card8])
    deck2   = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn    = Turn.new(player1, player2)
    winner  = turn.winner
    
    expect(winner).to eq(player2)
  end

  it 'can award spoils' do
    deck1   = Deck.new([@card1, @card2, @card5, @card8])
    deck2   = Deck.new([@card4, @card3, @card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn    = Turn.new(player1, player2)
    winner  = turn.winner
    
    turn.pile_cards

    expect(turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])

    turn.award_spoils(winner)

    expect(deck1).to eq(player1.deck)
    expect(deck2).to eq(player2.deck)
  end
 # MUTUALLY_ASSURED_DESTRUCTION TURN TYPE
  it 'can determine turn type' do
    card6   = Card.new(:diamond, '8', 8)
    deck1   = Deck.new([@card1, @card2, @card5, @card8])
    deck2   = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn    = Turn.new(player1, player2)
    winner  = turn.winner

    expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it 'can determine the winner' do
    card6   = Card.new(:diamond, '8', 8)
    deck1   = Deck.new([@card1, @card2, @card5, @card8])
    deck2   = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn    = Turn.new(player1, player2)
    winner  = turn.winner

    expect(winner = turn.winner).to eq('No Winner')
  end

  it 'does not award spoils' do
    card6   = Card.new(:diamond, '8', 8)
    deck1   = Deck.new([@card1, @card2, @card5, @card8])
    deck2   = Deck.new([@card4, @card3, card6, @card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn    = Turn.new(player1, player2)
    winner  = turn.winner

    turn.pile_cards

    expect(turn.spoils_of_war).to eq([])
    expect(deck1).to eq(player1.deck)
    expect(deck2).to eq(player2.deck)
  end
end