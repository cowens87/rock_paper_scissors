require 'date'
require_relative '../modules/shiftable'

class Decryptor
  include Shiftable

  attr_reader :cipher_text,
            :key,
            :date,
            :shift_categories,
            :characters

  def initialize(ciphertext, key, date = self.todays_date)
    @cipher_text      = ciphertext
    @key              = key
    @date             = date
    @shift_categories = [:a, :b, :c, :d]
    @characters       = ("a".."z").to_a << ' '
  end

  def split_message
    @cipher_text.downcase.split('')
  end

  def rotated_hash(category)
    @characters.zip(@characters.rotate((total_shifts[category]*-1) % 27)).to_h
  end
end
