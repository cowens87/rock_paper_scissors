require './test/test_helper'
require './lib/braille_translator'

RSpec.describe 'BrailleTranslator', type: :feature do
  before(:each) do
    @braillator = BrailleTranslator.new
  end
  
  it 'test it exists and has attributes' do
    expect(@braillator).to be_a(BrailleTranslator)
  end

  it 'test the alphabet has been reversed' do
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", 
      "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    expect(@braillator.braille_dictionary.values).to eq(expected)
  end

  it 'test it can translate one braille character' do
    expect(@braillator.translate_braille_char(['00', '00', '..'])).to eq('g')
  end
  
  it 'test it can translate multiple characters' do
    input = [['00', '0.', '0.'], ['.0', '0.', '..'],['00', '00', '..']]
    expect(@braillator.translate_braille_word(input)).to eq(["p", "i", "g"])
  end

  it 'test it can count number of letters' do
    input    = "00.000.0..000.00\n0.0.000...0.0..0\n0.....0.....0.00\n"
    expect(@braillator.num_of_letters(input)).to eq(8)
    input    = "0..0\n000.\n....\n"
    expect(@braillator.num_of_letters(input)).to eq(2)
  end

  it 'test it can convert braille input into linear string' do
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = "0.00..0..0..0.0.0.0.0.0.0..00........000.00..00.0.000.0.0.0.00.0.."
    expect(@braillator.restructure_braille_character(input)).to eq(expected)
  end

  it 'test it can separate braille characters' do
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", 
                ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."]
    expect(@braillator.separate_braille_chars(input)).to eq(expected)
  end

  it 'test it can find braille characters' do
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expect(@braillator.find_braille_character(input).first).to eq(['0.00..'])
  end

  it 'test_it_can_join_braille_dictionary_keys' do
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = {
                ["0....."]=>"a", ["0.0..."]=>"b", ["00...."]=>"c", ["00.0.."]=>"d", 
                ["0..0.."]=>"e", ["000..."]=>"f", ["0000.."]=>"g", ["0.00.."]=>"h", 
                [".00..."]=>"i", [".000.."]=>"j", ["0...0."]=>"k", ["0.0.0."]=>"l", 
                ["00..0."]=>"m", ["00.00."]=>"n", ["0..00."]=>"o", ["000.0."]=>"p", 
                ["00000."]=>"q", ["0.000."]=>"r", [".00.0."]=>"s", [".0000."]=>"t", 
                ["0...00"]=>"u", ["0.0.00"]=>"v", [".000.0"]=>"w", ["00..00"]=>"x", 
                ["00.000"]=>"y", ["0..000"]=>"z", ["......"]=>" "
              }
    expect(@braillator.join_braille_dictionary_keys(input)).to eq(expected)
  end

  it 'test_it_can_translate_from_braille_to_english' do
    input    = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expect(@braillator.braille_translator(input)).to eq('hello world')
    input    = "0..0\n000.\n....\n"
    expect(@braillator.braille_translator(input)).to eq('hi')
  end
end