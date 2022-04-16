class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @turns.last
  end

  def number_correct
    @turns.count { |turn| turn.correct == true }
  end

  def number_correct_by_category(category)
    @turns.count { |turn|turn.card.category == category && turn.correct? == true }
  end
# helper method for percent correct
  def total_guesses
    @turns.count
  end

  def percent_correct
    (number_correct.to_f/total_guesses * 100)
  end
# helper method for percent_correct_by_category
  def total_in_category(category)
    @turns.count { |turn| turn.card.category == category }
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category)/total_in_category(category).to_f * 100)
  end
end
