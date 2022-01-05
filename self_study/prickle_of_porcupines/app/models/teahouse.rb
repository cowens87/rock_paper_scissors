class Teahouse < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :boba_teas, dependent: :destroy

  def self.sort_by_tea_count
    select("teahouses.*, count(boba_teas) as tea_count")
      .joins(:boba_teas)
      .group(:id)
      .order("tea_count DESC")
  end

  def self.exact_match(match)
    where(name: match)
  end

  def self.par_match(match)
    where("name like ?", "%#{match}%")
  end
end
