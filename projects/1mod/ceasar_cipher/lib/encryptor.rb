require 'date'
require_relative '../modules/shiftable'

class Encryptor
  include Shiftable
  attr_reader :message,
            :key,
            :date,
            :shift_categories,
            :characters
  
  def initialize(message, key = self.generate_key, date = self.todays_date)
    @key              = key
    @message          = message
    @date             = date
    @shift_categories = [:a, :b, :c, :d]
    @characters       = ("a".."z").to_a << ' '
  end

  def split_message
    @message.downcase.split('')
  end

  def rotated_hash(category)
    @characters.zip(@characters.rotate(total_shifts[category] % 27)).to_h
  end
end
