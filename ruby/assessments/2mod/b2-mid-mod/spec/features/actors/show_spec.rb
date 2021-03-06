require 'rails_helper'

RSpec.describe 'As a user', type: :feature do
  describe 'When I visit an actors show page' do
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
    # Extension
    it 'I see that actors name and age And I see a unique list of all of the actors this particular actor has worked with' do
      visit actor_path(@leo_dicap.id) 

      within("#actor-info") do
        expect(page).to have_content(@leo_dicap.name)
        expect(page).to have_content(@leo_dicap.age)
        expect(page).to have_content(@leo_dicap.list_of_colleagues)
        save_and_open_page
        # expect(page).to have_content("List of Colleagues: #{@kathy_bates.name}")
      end
    end
  end
end