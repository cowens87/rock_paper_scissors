module Shiftable
  # Generate keys and offsets

  def generate_key
    key = []
    5.times { key << rand(0..9) }
    key.join
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def last_four_of_date
    (@date.to_i ** 2).to_s[-4..-1]
  end

  def set_key_shifts
    {
      a: @key[0..1].to_i,
      b: @key[1..2].to_i,
      c: @key[2..3].to_i,
      d: @key[3..4].to_i
    }
  end

  def set_offset_shifts
    {
      a: last_four_of_date[0].to_i,
      b: last_four_of_date[1].to_i,
      c: last_four_of_date[2].to_i,
      d: last_four_of_date[3].to_i
    }
  end

  # character shifts

  def total_shifts
    set_key_shifts.merge!(set_offset_shifts) { |cat, key, offset| key + offset }
  end

  def encrypt_or_decrypt_message
    shift_message_characters.values.reduce(&:zip).join
  end

  def shift_message_characters
    shifted_characters = {}
    set_message_to_shift_categories.map do |cat, chars|
      chars.map do |char|
        if !@characters.include?(char)
          (shifted_characters[cat] ||= []) << char
        else
          (shifted_characters[cat] ||= []) << shifted_character_sets[cat][char]
        end
      end
    end
    shifted_characters
  end

  def set_message_to_shift_categories
    shift_to_chars = {}
    split_message.each_with_index do |char, index|
      category = index % @shift_categories.count
      (shift_to_chars[@shift_categories[category]] ||= []) << char
    end
    shift_to_chars
  end

  def shifted_character_sets
    @shift_categories.each_with_object({}) do |category, assigned_chars| 
      assigned_chars[category] = rotated_hash(category)
    end
  end

  # read/write files 

  def read_file(file, action)
    handle = File.open(file, "#{action}")
    message = handle.read
    handle.close
    message
  end

  def write_file(file, action, hash_name, key)
    encryption = File.open(file, "#{action}")
    encryption.write(hash_name["#{key}".to_sym])
    encryption.close
  end

  def output_statement(file, key, date)
    puts "Created #{file} with the key #{key} and date #{date}"
  end
end
