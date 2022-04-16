require './lib/english_translator'

handle        = File.open(ARGV[0], "r")
message       = handle.read.chomp
handle.close

englator      = EnglishTranslator.new
braille       = englator.translator(message)

writer        = File.open(ARGV[1], "w")
writer.write(braille)
writer.close

puts "Created #{ARGV[1]} containing #{message.length} characters"