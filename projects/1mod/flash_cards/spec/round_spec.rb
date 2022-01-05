require './lib/round'
require './lib/card'
require './lib/turn'
require './lib/deck'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck   = Deck.new([@card_1, @card_2, @card_3])
    @round  = Round.new(@deck)
  end

  it 'test_it_exists_and_has_attributes' do
    expect(@round.deck).to eq(@deck)
  end

  it 'test_it_has_turns' do
    expect(@round.turns).to eq([])
  end

  it 'test_it_can_find_current_card' do
    expect(@round.current_card).to eq(@card_1) 
  end

  it 'test_it_can_take_a_new_turn' do
    new_turn = @round.take_turn("Juneau")

    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true) 
    expect(@round.turns).to eq([new_turn]) 
  end

  it 'test_it_can_find_number_of_correct_guesses' do
    new_turn = @round.take_turn("Juneau")
    
    expect(@round.number_correct).to eq(1) 
  end

  it 'test_it_has_another_turn' do
    new_turn = @round.take_turn("Juneau")

    expect(@round.current_card).to eq(@card_2) 

    @round.take_turn("Venus")

    expect(@round.turns.count).to eq(2) 
    expect(@round.turns.last.feedback).to eq("Incorrect.") 
    expect(@round.number_correct).to eq(1) 
  end

  it 'test_it_can_find_number_correct_by_category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.number_correct_by_category(:Geography)).to eq(1) 
    expect(@round.number_correct_by_category(:STEM)).to eq(0) 
  end

  it 'test_it_can_find_total_guesses' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.total_guesses).to eq(2) 
  end

  it 'test_it_can_find_percent_correct' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.percent_correct).to eq(50.0) 
  end

  it 'test_it_can_find_total_in_category' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North North West")

    expect(@round.total_in_category(:STEM)).to eq(2) 
  end

  it 'test_it_can_find_percent_correct_by_category' do
    @round.take_turn("Juneau")

    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)

    @round.take_turn("Venus")

    expect(@round.current_card).to eq(@card_3) 
  end
end
