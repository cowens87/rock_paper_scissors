require './lib/deck'
require './lib/player'
require './lib/game'
require './lib/message'
require './lib/card_generator'

message = Message.new
cards   = CardGenerator.new('./cards.txt').cards.shuffle
message.intro1
name1   = gets.chomp.to_s.capitalize
player1 = Player.new(name1, Deck.new(cards.first(26)))
message.intro2
name2   = gets.chomp.to_s.capitalize
player2 = Player.new(name2, Deck.new(cards.first(26)))
puts "The players today are #{name1} and #{name2}.\nType 'GO' to start the game!"
puts "-" * 60
answer  = gets.chomp.to_s.upcase
require 'pry'; binding.pry
if answer == 'GO'
  game = Game.new(player1, player2)
  game.start
else
  puts "Goodbye!"
end