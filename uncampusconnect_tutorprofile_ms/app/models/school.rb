class School < ApplicationRecord
  has_many :tutor_schools
  has_many :tutors, through: :tutor_schools
end
