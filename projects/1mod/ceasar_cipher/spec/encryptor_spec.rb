require './spec/test_helper'

RSpec.describe 'Encryptor', type: :feature do
  before(:each) do
    @encryptor = Encryptor.new("hello world", "02715", "040895")
  end

  it 'exists and has attributes' do
    expect(@encryptor).to be_instance_of(Encryptor)
    expect(@encryptor.message).to eq("hello world") 
    expect(@encryptor.key).to eq("02715")
    expect(@encryptor.date).to eq("040895")
    expect(@encryptor.shift_categories).to eq([:a, :b, :c, :d])

    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    
    expect(@encryptor.characters).to eq(expected)
  end

   it 'can generate key' do
    expect(@encryptor.generate_key).to be_instance_of(String)
    expect(@encryptor.generate_key.to_i).to be_instance_of(Integer)
    expect(@encryptor.generate_key.length).to eq(5)
  end

  it 'can find todays date' do
    encryptor = Encryptor.new("hello world", "12345")
    expected  = (Date.today.strftime("%d%m%y"))
    expect(encryptor.todays_date).to be_instance_of(String)
    expect(encryptor.date).to eq(expected)
    expect(encryptor.todays_date).to eq(expected)
    expect(encryptor.todays_date.length).to eq(6)
  end

  it 'can set key shifts' do
    expect(@encryptor.set_key_shifts).to eq({a: 02, b: 27, c: 71, d: 15})
  end

  it 'can transform date' do
    expect(@encryptor.last_four_of_date).to eq('1025')
  end

  it 'can set offset shifts' do
    expect(@encryptor.set_offset_shifts).to eq({a: 1, b: 0, c: 2, d: 5})
  end

  it 'can find total shifts' do
    expect(@encryptor.total_shifts).to eq({a: 3, b: 27, c: 73, d: 20})
  end

  it 'can assign shift categories to message' do
    expected = ({:a=>['h','o','r'], :b=>['e',' ','l'], :c=>['l','w','d'], :d=>['l', 'o']})
    expect(@encryptor.set_message_to_shift_categories).to eq(expected)
  end

  it 'can create shifted character sets' do
    expected = {
      :a =>{'a'=>'d', 'b'=>'e', 'c'=>'f', 'd'=>'g', 'e'=>'h', 'f'=>'i', 'g'=>'j', 'h'=>'k', 'i'=>'l', 'j'=>'m', 'k'=>'n', 'l'=>'o', 'm'=>'p', 'n'=>'q', 'o'=>'r', 'p'=>'s', 'q'=>'t', 'r'=>'u', 's'=>'v', 't'=>'w', 'u'=>'x', 'v'=>'y', 'w'=>'z', 'x'=>' ', 'y'=>'a', 'z'=>'b', ' '=>'c'},
      :b =>{'a'=>'a', 'b'=>'b', 'c'=>'c', 'd'=>'d', 'e'=>'e', 'f'=>'f', 'g'=>'g', 'h'=>'h', 'i'=>'i', 'j'=>'j', 'k'=>'k', 'l'=>'l', 'm'=>'m', 'n'=>'n', 'o'=>'o', 'p'=>'p', 'q'=>'q', 'r'=>'r', 's'=>'s', 't'=>'t', 'u'=>'u', 'v'=>'v', 'w'=>'w', 'x'=>'x', 'y'=>'y', 'z'=>'z', ' '=>' '},
      :c =>{'a'=>'t', 'b'=>'u', 'c'=>'v', 'd'=>'w', 'e'=>'x', 'f'=>'y', 'g'=>'z', 'h'=>' ', 'i'=>'a', 'j'=>'b', 'k'=>'c', 'l'=>'d', 'm'=>'e', 'n'=>'f', 'o'=>'g', 'p'=>'h', 'q'=>'i', 'r'=>'j', 's'=>'k', 't'=>'l', 'u'=>'m', 'v'=>'n', 'w'=>'o', 'x'=>'p', 'y'=>'q', 'z'=>'r', ' '=>'s'},
      :d =>{'a'=>'u', 'b'=>'v', 'c'=>'w', 'd'=>'x', 'e'=>'y', 'f'=>'z', 'g'=>' ', 'h'=>'a', 'i'=>'b', 'j'=>'c', 'k'=>'d', 'l'=>'e', 'm'=>'f', 'n'=>'g', 'o'=>'h', 'p'=>'i', 'q'=>'j', 'r'=>'k', 's'=>'l', 't'=>'m', 'u'=>'n', 'v'=>'o', 'w'=>'p', 'x'=>'q', 'y'=>'r', 'z'=>'s', ' '=>'t'},
    }
    expect(@encryptor.shifted_character_sets).to eq(expected)
  end

  it 'can shift message characters' do
    expected = ({:a=>["k", "r", "u"], :b=>["e", " ", "l"], :c=>["d", "o", "w"], :d=>["e", "h"]})
    expect(@encryptor.shift_message_characters).to eq(expected)

    #Testing for when character not in character set
    encryptor = Encryptor.new("l33t", "02715", "040895")
    expected  = ({:a=>["o"], :b=>["3"], :c=>["3"], :d=>["m"]})
    expect(encryptor.shift_message_characters).to eq(expected)
  end

  it 'can encrypt message' do
    expect(@encryptor.encrypt_or_decrypt_message).to eq("keder ohulw")
  end
end