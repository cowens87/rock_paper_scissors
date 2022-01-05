class Studio < ApplicationRecord
  validates_presence_of :name, :location
  has_many :movies

  def list_of_movies
    movies.select(:title).distinct.pluck(:title)
  end
end
