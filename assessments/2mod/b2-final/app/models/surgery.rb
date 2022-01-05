class Surgery < ApplicationRecord
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def self.find_others_by_day(surg_info)
    where(day_of_week: surg_info.day_of_week).where.not(id: surg_info.id)
  end
end
