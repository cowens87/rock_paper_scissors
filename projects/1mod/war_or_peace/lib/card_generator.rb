require './lib/card'

class CardGenerator
  attr_reader :card_file
  def initialize(card_file)
    @card_file = File.open(card_file,"r")
  end

  def cards
    @card_file.inject([]) do |playing_cards, line|
      a_card = line.chop.split(', ')
      make_a_card = Card.new(a_card[1], a_card[0], a_card[2])
      playing_cards << make_a_card
    end
  end
end