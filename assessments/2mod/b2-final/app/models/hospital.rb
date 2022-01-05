class Hospital < ApplicationRecord
  has_many :doctors
  has_many :surgeries, through: :doctor_surgeries
end
