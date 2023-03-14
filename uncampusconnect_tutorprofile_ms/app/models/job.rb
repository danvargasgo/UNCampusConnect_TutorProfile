class Job < ApplicationRecord
  has_many :tutor_jobs
  has_many :tutors, through: :tutor_jobs
end
