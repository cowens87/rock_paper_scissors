require './spec/test_helper'

RSpec.describe 'Enigma', type: :feature do
  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists and has attributes' do
    expect(@enigma).to be_instance_of(Enigma)
  end

  it 'can encrypt message and change attributes' do
    expected = ({ encryption: "keder ohulw", key: "02715", date: "040895" })
    expect(@enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
    expect(@enigma.message).to eq('hello world')
    expect(@enigma.key).to eq('02715')
    expect(@enigma.date).to eq('040895')
  end

  it 'can decrypt message' do
    expected = ({ decryption: "hello world", key: '02715', date: '040895' })
    expect(@enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected)
    expect(@enigma.cipher_text).to eq('keder ohulw')
    expect(@enigma.key).to eq('02715')
    expect(@enigma.date).to eq('040895')
  end

  it 'can generate key' do
    expect(@enigma.generate_key).to be_instance_of(String)
    expect(@enigma.generate_key.to_i).to be_instance_of(Integer)
    expect(@enigma.generate_key.length).to eq(5)
  end

  it 'does nothing with weird characters' do
    expected = ({encryption: "ke7e% o1u-w", key: '02715', date: '040895'})
    expect(@enigma.encrypt('he7l% w1r-d', '02715', '040895')).to eq(expected)

    expected = ({ decryption: "he7l% w1r-d", key: '02715', date: '040895'})
    expect(@enigma.decrypt('ke7e% o1u-w', '02715', '040895')).to eq(expected)
  end
end