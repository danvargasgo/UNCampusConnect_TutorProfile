class Language < ApplicationRecord
  has_many :tutor_languages
  has_many :tutors, through: :tutor_languages
end