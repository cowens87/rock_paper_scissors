require './lib/ride'
require './lib/attendee'

RSpec.describe Attendee do
  before(:each) do
    @attendee = Attendee.new('Bob', 20)
  end

  it 'exist' do
    expect(@attendee.name).to eq 'Bob'
    expect(@attendee.spending_money).to eq 20
  end

  it 'has interests' do
    expect(@attendee.interests).to eq []
  end

  it 'can add interests' do
    @attendee.add_interest('Bumper Cars')
    @attendee.add_interest('Ferris Wheel')

    expect(@attendee.interests).to eq ['Bumper Cars', 'Ferris Wheel']
  end
end