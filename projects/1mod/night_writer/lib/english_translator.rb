require './module/translatable'

class EnglishTranslator 
  include Translatable

  def translate_letter(letter)
    lookup_character(letter.downcase)[1]
  end
  
  def translate_word(word)
    word.chars.collect do |letter|
      translate_letter(letter)
    end
  end

  def braille_split_top_mid_bottom(phrase)
    translate_word(phrase).transpose
  end

  def braille_columns_to_lines(phrase) 
    braille_split_top_mid_bottom(phrase).collect do |column|
      column.join(",") + "\n"
    end
  end

  def final_braille(phrase)
    braille_columns_to_lines(phrase).join(",").gsub(",","")
  end

  def split_by_character_limit(phrase)
    phrase.scan(/.{1,40}/)
  end

  def translator(phrase)
    split_by_character_limit(phrase).collect do |word|
      EnglishTranslator.new.final_braille(word)
    end.join("\n")
  end
end