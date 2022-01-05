class Request < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip, :reason
  enum status: ['In Progress', 'Pending', 'Approved', 'Rejected']
  has_many :boba_tea_requests
  has_many :boba_teas, through: :boba_tea_requests
end
