require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  before(:each) do
    # Studios:
      @castlerock_ent = Studio.create!(name: 'Castle Rock Entertainment', location: 'Los Angeles, CA')
      @paramount_pictures = Studio.create!(name: 'Paramount Pictures', location: 'Los Angeles, CA')

      # Movies:
      @misery = Movie.create!(title: 'Misery', creation_year: 1990, genre: 'Thriller/Horror', studio_id: @castlerock_ent.id)
      @titanic = Movie.create!(title: 'Titanic', creation_year: 1997, genre: 'Romance/Drama', studio_id: @paramount_pictures.id)
      @shutter_island = Movie.create!(title: 'Shutter Island', creation_year: 2010, genre: 'Thriller Mystery', studio_id: @paramount_pictures.id)

      # Actors:
      @kathy_bates = Actor.create!(name: 'Kathy Bates', age: 72)
      @leo_dicap = Actor.create!(name: 'Leonardo Dicaprio', age: 46)

      # Actor_Movies:
      actmov1 = ActorMovie.create!(actor_id: @kathy_bates.id, movie_id: @misery.id)
      actmov2 = ActorMovie.create!(actor_id: @kathy_bates.id, movie_id: @titanic.id)
      actmov3 = ActorMovie.create!(actor_id: @leo_dicap.id, movie_id: @titanic.id)
      actmov4 = ActorMovie.create!(actor_id: @leo_dicap.id, movie_id: @shutter_island.id)
    end
    
  describe 'relationships' do
    it {should belong_to :actor}
    it {should belong_to :movie}
  end
end
