require './lib/braille_translator'

braillator      = BrailleTranslator.new
braille_message = braillator.read_file(ARGV[0], "r")
require 'pry'; binding.pry
english         = braillator.braille_translator(braille_message)

writer          = File.open(ARGV[1], "w")
writer.write(english)
writer.close

puts "Created #{ARGV[1]} containing #{english.length} characters"