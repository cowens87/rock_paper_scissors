require './lib/enigma'
require './lib/encryptor'

enigma     = Enigma.new
message    = enigma.read_file(ARGV[0], "r")
key        = ARGV[2] ||= enigma.generate_key
date       = ARGV[3] ||= Date.today.strftime("%d%m%y")
encrypted  = enigma.encrypt(message, key, date)
enigma.write_file(ARGV[1], "w", encrypted, 'encryption')
enigma.output_statement(ARGV[1], enigma.key, enigma.date)
