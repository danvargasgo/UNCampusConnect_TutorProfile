class TutorSchool < ApplicationRecord
  belongs_to :tutor
  belongs_to :school
end
