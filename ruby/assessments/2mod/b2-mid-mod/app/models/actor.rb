class Actor < ApplicationRecord
  validates_presence_of :name, :age
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.by_name(actor_name)
    where(name: actor_name).first
  end

  def list_of_colleagues 
    mov_ids = Actor.joins(:actor_movies).where(id: self.id).pluck(:movie_id)
    actor_names = ActorMovie.joins(:actor).where(movie_id: mov_ids).distinct.pluck(:name)
    actor_names.delete(self.name)
    actor_names
  end
end
