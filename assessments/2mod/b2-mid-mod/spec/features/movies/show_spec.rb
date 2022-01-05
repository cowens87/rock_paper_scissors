require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe 'When I visit the movies show page' do
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
      @james_caan = Actor.create!(name: 'James Caan', age: 80)

      # Actor_Movies:
      actmov1 = ActorMovie.create!(actor_id: @kathy_bates.id, movie_id: @misery.id)
      actmov2 = ActorMovie.create!(actor_id: @kathy_bates.id, movie_id: @titanic.id)
      actmov3 = ActorMovie.create!(actor_id: @leo_dicap.id, movie_id: @titanic.id)
      actmov4 = ActorMovie.create!(actor_id: @leo_dicap.id, movie_id: @shutter_island.id)
    end
    # User Story 2
    it ' I see a all of a movies details and all actors from oldest to youngest, along with average age' do
      visit movie_path(@titanic.id) 

      within("#movie-details") do
        expect(page).to have_content(@titanic.title)
        expect(page).to have_content(@titanic.creation_year)
        expect(page).to have_content(@titanic.genre)
        expect(page).to have_content(@kathy_bates.name)
        expect(page).to have_content(@leo_dicap.name)
        expect(@kathy_bates.name).to appear_before(@leo_dicap.name)
        expect(@leo_dicap.name).to_not appear_before(@kathy_bates.name)
        expect(page).to have_content("Average Actor Age: #{@titanic.actor_avg_age}")
      end
    end
    # User Story 3
    it 'I see a form to add an actors name to a movie and when I submit I go back to the show page And I see the actors info' do
      visit movie_path(@misery.id) 
      
      within("#movie-details") do
        expect(page).to have_content(@misery.title)
        expect(page).to have_content(@misery.creation_year)
        expect(page).to have_content(@misery.genre)
        expect(page).to have_content(@kathy_bates.name)
        expect(page).to have_content("Average Actor Age: #{@misery.actor_avg_age}")
      end
      
      expect(page).to have_content('Add an Actor')
      
      fill_in 'Add an Actor', with: @james_caan.name
      click_button 'Add'
      
      expect(current_path).to eq(movie_path(@misery.id))
      expect(page).to have_content(@james_caan.name)
    end
  end
end