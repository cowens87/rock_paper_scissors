require './lib/enigma'
require './lib/decryptor'

enigma      = Enigma.new
cipher_text = enigma.read_file(ARGV[0], "r")
date        = ARGV[3] ||= Date.today.strftime("%d%m%y")
decrypted   = enigma.decrypt(cipher_text, ARGV[2], date)
enigma.write_file(ARGV[1], "w", decrypted, 'decryption')
enigma.output_statement(ARGV[1], enigma.key, enigma.date)

