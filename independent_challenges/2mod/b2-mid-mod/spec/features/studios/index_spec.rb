require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe 'When I visit the studio index page' do
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
    # User Story 1 
    it ' I see a list of all of the movie studios he names of all of its movies' do
      visit studios_path 

      within("#studio-info-#{@paramount_pictures.id}") do
        expect(page).to have_content(@paramount_pictures.name)
        expect(page).to have_content(@paramount_pictures.location)
        expect(page).to have_content(@titanic.title)
        expect(page).to have_content(@shutter_island.title)
      end

      within("#studio-info-#{@castlerock_ent.id}") do
        expect(page).to have_content(@castlerock_ent.name)
        expect(page).to have_content(@castlerock_ent.location)
        expect(page).to have_content(@misery.title)
      end
    end
  end
end