require './lib/passenger'

RSpec.describe Passenger do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    @taylor  = Passenger.new({"name" => "Taylor", "age" => 12})    
  end

  it 'exists and has attributes' do
    expect(@charlie.name).to eq('Charlie')
    expect(@charlie.age).to eq(18)
  end

  it 'can verify if passenger is an adult' do
    expect(@charlie.adult?).to eq(true)
    expect(@taylor.adult?).to eq(false)
  end

  it 'can verify if passenger is driver' do
    expect(@charlie.driver?).to eq(false)
    @charlie.drive
    expect(@charlie.driver?).to eq(true)
  end
end