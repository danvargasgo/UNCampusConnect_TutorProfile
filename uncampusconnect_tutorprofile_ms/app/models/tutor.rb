class Tutor < ApplicationRecord
  has_and_belongs_to_many :skills

  has_many :tutor_languages
  has_many :languages, through: :tutor_languages

  has_many :tutor_schools
  has_many :schools, through: :tutor_schools

  has_many :tutor_jobs
  has_many :jobs, through: :tutor_jobs

  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :languages
  accepts_nested_attributes_for :schools
  accepts_nested_attributes_for :jobs
end
