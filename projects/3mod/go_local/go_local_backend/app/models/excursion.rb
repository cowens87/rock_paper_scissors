class Excursion < ApplicationRecord
  validates :title, :description, :location, presence: true

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :favorites, dependent: :destroy
  belongs_to :user

  alias_attribute :author_id, :user_id

  def self.cities
    distinct.pluck(:nearest_city)
  end
end
