require_relative '../modules/shiftable'
require './lib/encryptor'
require './lib/decryptor'

class Enigma
  attr_reader :message,
            :cipher_text,
            :key,
            :date
  include Shiftable

  def initialize
    @message     = message
    @cipher_text = cipher_text
    @key         = key
    @date        = date
  end

  def encrypt(message, key = self.generate_key, date = self.todays_date)
    @message  = message
    @key      = key
    @date     = date
    encryptor = Encryptor.new(@message, @key, @date)

    {
      encryption: encryptor.encrypt_or_decrypt_message,
      key: encryptor.key,
      date: encryptor.date
    }
  end

  def decrypt(cipher_text, key, date = self.todays_date)
    @cipher_text = cipher_text
    @key         = key
    @date        = date
    decryptor    = Decryptor.new(@cipher_text, @key, @date)

    {
      decryption: decryptor.encrypt_or_decrypt_message,
      key: decryptor.key,
      date: decryptor.date
    }
  end
end
