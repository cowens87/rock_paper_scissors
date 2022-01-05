require 'rails_helper'

RSpec.describe Studio, type: :model do
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
    it { should validate_presence_of :name}
    it { should validate_presence_of :location}
  end
  
  describe 'relationships' do
    it {should have_many :movies}
  end

  # User Story 1
  describe 'All of the movies associated to a studio' do
    it 'Can list names of all of its movies' do
      expect(@paramount_pictures.list_of_movies).to eq(["Shutter Island", "Titanic"])
      expect(@castlerock_ent.list_of_movies).to eq(["Misery"])
    end
  end 
end
