require './lib/trail'
require './lib/park'
require './lib/hiker'

RSpec.describe Trail do
  before(:each) do
   @trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
   @trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
   @trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})
   @park1  = Park.new('Capitol Reef')
   @park2  = Park.new('Bryce Canyon')
   @hiker  = Hiker.new('Dora', :moderate)
  end

  it 'exists' do
    expect(@trail1.name).to eq('Grand Wash')
    expect(@trail1.length).to eq(2.2)
    expect(@trail1.level).to eq(:easy)
  end
end