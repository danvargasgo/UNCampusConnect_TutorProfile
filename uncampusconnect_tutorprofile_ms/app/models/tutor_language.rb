class TutorLanguage < ApplicationRecord
  belongs_to :tutor
  belongs_to :language
end
