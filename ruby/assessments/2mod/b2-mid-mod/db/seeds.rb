# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
