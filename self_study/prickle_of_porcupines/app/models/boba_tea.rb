class BobaTea < ApplicationRecord
  belongs_to :teahouse
  has_many :boba_tea_requests, dependent: :destroy
  has_many :requests, through: :boba_tea_requests
  
  validates_presence_of :name, :price, :base, :description
  validates_inclusion_of :caffeinated, in: [true, false]

  def self.true_false
    order(caffeinated: :desc)
  end

  def self.teas_by_price(amount)
    where('price >= ?', amount)
  end

  def self.alpha_sort
    order(:name)
  end

  def self.find_by_name(tea_name)
    where("lower(name) LIKE ?", "%#{tea_name.downcase}%")
  end
end
