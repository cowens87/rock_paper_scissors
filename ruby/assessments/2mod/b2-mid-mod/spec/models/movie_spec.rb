require 'rails_helper'

RSpec.describe Movie, type: :model do
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
  
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :creation_year}
    it { should validate_presence_of :genre}
  end
  
  describe 'relationships' do
    it {should have_many :actor_movies}
    it {should have_many(:actors).through(:actor_movies)}
  end
  # User Story 2
  describe 'Name of all actors listed from oldest to youngest' do
    it 'Can sort actors by age' do
      expect(@titanic.actors_by_age.pluck(:name)).to eq(["Kathy Bates", "Leonardo Dicaprio"])
    end
  end
  
  describe 'The average age of all of the movies actors' do
    it 'Can find the average age of actors' do
      expect(@titanic.actor_avg_age.round).to eq(59)
    end
  end
end
