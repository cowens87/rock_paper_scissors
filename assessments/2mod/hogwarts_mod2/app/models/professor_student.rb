class ProfessorStudent <ApplicationRecord
  belongs_to :professor
  belongs_to :student

  # Utilized when you need one specific professor and one specific child and 
  # one specific piece of data pertaining to both
end
