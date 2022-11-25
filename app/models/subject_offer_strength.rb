class SubjectOfferStrength < ApplicationRecord
  belongs_to :subject_offer
  belongs_to :strength

  validates :strength_id, presence: true
end
