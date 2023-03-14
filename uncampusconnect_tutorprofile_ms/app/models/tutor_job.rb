class TutorJob < ApplicationRecord
  belongs_to :job
  belongs_to :tutor
end
