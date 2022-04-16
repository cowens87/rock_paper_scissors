class User < ApplicationRecord
  validates :id, presence: true

  has_many :favorites, dependent: :destroy
  has_many :excursions, dependent: :destroy

  def saved_excursions
    Excursion.joins(:favorites).where(favorites: { user_id: id }).order(:nearest_city)
  end
end
