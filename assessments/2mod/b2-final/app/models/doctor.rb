class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries

  def self.by_name(doctor_name)
    where(name: doctor_name).first
  end
end
