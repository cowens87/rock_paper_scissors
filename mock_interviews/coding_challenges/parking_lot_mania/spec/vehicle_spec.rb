require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})    
    @taylor  = Passenger.new({"name" => "Taylor", "age" => 12})
    @vehicle = Vehicle.new("2001", "Honda", "Civic")      
  end

  it 'exists and has attributes' do
    expect(@vehicle.year).to eq('2001')
    expect(@vehicle.make).to eq('Honda')
    expect(@vehicle.model).to eq('Civic')
  end

  it 'can see if vehicle is speeding' do
     expect(@vehicle.speeding?).to eq(false)
     @vehicle.speed
     expect(@vehicle.speeding?).to eq(true)
  end
end