require './lib/character'
require './lib/show'
require './lib/network'

RSpec.describe Network do
   before(:each) do
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
    @baywatch = Show.new("Baywatch", "Gregory Bonann", [@mitch])
    @nbc = Network.new("NBC")
  end

  it 'exists' do
    expect(@nbc.name).to eq('NBC')
  end

  it 'can add shows' do
    expect(@nbc.shows).to eq([])
    
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    
    expect(@nbc.shows).to eq([@knight_rider, @parks_and_rec])
    
    # A character is a main character for the network if their salary is greater than 500_000 
    # and their character name has no lowercase letters.
    expect(@nbc.main_characters).to eq([@kitt])

    actors_show = 
     { @knight_rider => ["David Hasselhoff", "William Daniels"],
      @parks_and_rec => ["Amy Poehler", "Nick Offerman"] }

    expect(@nbc.actors_by_show).to eq(actors_show)

    @nbc.add_show(@knight_rider)
    @nbc.add_show(@baywatch)
    @nbc.add_show(@parks_and_rec)

    h = {
         "David Hasselhoff" => [@knight_rider, @baywatch],
         "William Daniels" => [@knight_rider],
         "Amy Poehler" => [@parks_and_rec],
         "Nick Offerman" => [@parks_and_rec]
       }

    expect(@nbc.shows_by_actor).to eq(h)

    # An actor is considered prolific if they have been in more than one show for that network
    
    expect(@nbc.prolific_actors).to eq(["David Hasselhoff"])
  end
end