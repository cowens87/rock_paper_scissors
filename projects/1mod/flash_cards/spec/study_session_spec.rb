require "./lib/study_session"
require "./lib/round"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"

RSpec.describe StudySession do
  before(:each) do
    filename = './data/cards.txt'
    @study_session = StudySession.new(filename)
  end

  it 'test_it_exists_and_has_attributes' do
    expect(@study_session).to be_instance_of(StudySession)
  end

  it 'test_welcome_message' do
    expected = "Welcome! You're playing with 9 cards.\n" +
     "-------------------------------------------------"

    expect(@study_session.welcome_message).to eq(expected)
  end

  it 'test_it_can_find_categories' do
    expect(@study_session.find_categories).to eq([:German, :Spanish, :Portuguese, :Swahili])
  end
end