require './spec/test_helper'

RSpec.describe 'Decyptor', type: :feature do
  before(:each) do
    @decryptor = Decryptor.new("keder ohulw", "02715", "040895")
  end

  it 'exists and has attributes' do
    expect(@decryptor).to be_instance_of(Decryptor)
    expect(@decryptor.cipher_text).to eq("keder ohulw") 
    expect(@decryptor.key).to eq("02715")
    expect(@decryptor.date).to eq("040895")
    expect(@decryptor.shift_categories).to eq([:a, :b, :c, :d])

    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    
    expect(@decryptor.characters).to eq(expected)
  end

  it 'can assign shift categories to message' do
    expected = ({:a=>['k','r','u'], :b=>['e',' ','l'], :c=>['d','o','w'], :d=>['e', 'h']})
    expect(@decryptor.set_message_to_shift_categories).to eq(expected)
  end

  it 'can shift character sets' do
    expected = {
                :a=>{"a"=>"y", "b"=>"z", "c"=>" ", "d"=>"a", "e"=>"b", "f"=>"c", "g"=>"d", "h"=>"e", "i"=>"f", "j"=>"g", "k"=>"h", "l"=>"i", "m"=>"j", "n"=>"k", "o"=>"l", "p"=>"m", "q"=>"n", "r"=>"o", "s"=>"p", "t"=>"q", "u"=>"r", "v"=>"s", "w"=>"t", "x"=>"u", "y"=>"v", "z"=>"w", " "=>"x"},
                :b=>{"a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e", "f"=>"f", "g"=>"g", "h"=>"h", "i"=>"i", "j"=>"j", "k"=>"k", "l"=>"l", "m"=>"m", "n"=>"n", "o"=>"o", "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t", "u"=>"u", "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y", "z"=>"z", " "=>" "},
                :c=>{"a"=>"i", "b"=>"j", "c"=>"k", "d"=>"l", "e"=>"m", "f"=>"n", "g"=>"o", "h"=>"p", "i"=>"q", "j"=>"r", "k"=>"s", "l"=>"t", "m"=>"u", "n"=>"v", "o"=>"w", "p"=>"x", "q"=>"y", "r"=>"z", "s"=>" ", "t"=>"a", "u"=>"b", "v"=>"c", "w"=>"d", "x"=>"e", "y"=>"f", "z"=>"g", " "=>"h"},
                :d=>{"a"=>"h", "b"=>"i", "c"=>"j", "d"=>"k", "e"=>"l", "f"=>"m", "g"=>"n", "h"=>"o", "i"=>"p", "j"=>"q", "k"=>"r", "l"=>"s", "m"=>"t", "n"=>"u", "o"=>"v", "p"=>"w", "q"=>"x", "r"=>"y", "s"=>"z", "t"=>" ", "u"=>"a", "v"=>"b", "w"=>"c", "x"=>"d", "y"=>"e", "z"=>"f", " "=>"g"}
              }
    expect(@decryptor.shifted_character_sets).to eq(expected)
  end

  it 'can shift message characters' do
    expected = ({:a=>['h','o','r'], :b=>['e',' ','l'], :c=>['l','w','d'], :d=>['l', 'o']})
    expect(@decryptor.shift_message_characters).to eq(expected)

    decryptor = Decryptor.new("o33m", "02715", "040895")
    expected  = ({:a=>['l'], :b=>['3'], :c=>['3'], :d=>['t']})
    
    expect(decryptor.shift_message_characters).to eq(expected)
  end

  it 'can decrypt ciphertext' do
   expect(@decryptor.encrypt_or_decrypt_message).to eq("hello world")
  end
end