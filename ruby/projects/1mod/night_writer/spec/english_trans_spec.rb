require './test/test_helper'
require './lib/english_translator'

RSpec.describe 'EnglishTranslator', type: :feature do
  before(:each) do
    @englator = EnglishTranslator.new
  end

  it 'exists' do
    expect(@englator).to be_a(EnglishTranslator)
  end

  it 'can translate one letter to braille' do
    expect(@englator.translate_letter('h')).to eq(['0.', '00', '..'])
    expect(@englator.translate_letter('m')).to eq(["00", "..", "0."])
    expect(@englator.translate_letter('u')).to eq(['0.', '..', '00'])
  end

  it 'test it can downcase caps before translating' do 
    expect(@englator.translate_letter('M')).to eq(["00", "..", "0."])
  end

  it 'test it can translate one word to braille' do  
    expected = [['00', '0.', '0.'], ['.0', '0.', '..'],['00', '00', '..']]
    expect(@englator.translate_word('pig')).to eq(expected)
    expected = [["00", "0.", "0."], ["0.", ".0", "0."], ["00", "0.", "0."]]
    expect(@englator.translate_word('pop')).to eq(expected)
    expected = [["00", ".0", ".."], ["0.", "..", ".."], ["00", ".0", ".."]]
    expect(@englator.translate_word('dad')).to eq(expected)
  end

  it 'test it can break each letter down by top middle and bottom index' do
    expected = [["0.", ".0"], ["00", "0."], ["..", ".."]]
    expect(@englator.braille_split_top_mid_bottom('hi')).to eq(expected)
    expected = [["00", "0."], [".0", ".0"], ["0.", "0."]]
    expect(@englator.braille_split_top_mid_bottom('no')).to eq(expected)
  end

  it 'test it can convert braille array into linear lines' do
    expected = ["0.,.0\n", "00,0.\n", "..,..\n"]
    expect(@englator.braille_columns_to_lines('hi')).to eq(expected)
    expected = ["00,0.\n", ".0,.0\n", "0.,0.\n"]
    expect(@englator.braille_columns_to_lines('no')).to eq(expected)
  end

  it 'test it can create final braille structure' do 
    expected = "00.000.0..000.00\n0.0.000...0.0..0\n0.....0.....0.00\n"
    expect(@englator.final_braille('pigs fly')).to eq(expected)
  end

  it 'test it can split by the character limit' do 
    input    = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    expected = ["aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "a"]
    expect(@englator.split_by_character_limit(input)).to eq(expected)
  end

  it 'test it can create braille word structure' do
    expected = "0..0\n000.\n....\n"
    expect(@englator.translator('hi')).to eq(expected)
  end
end
