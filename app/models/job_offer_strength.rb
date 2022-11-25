class JobOfferStrength < ApplicationRecord
  belongs_to :job_offer, optional: true
  belongs_to :strength

  validates :strength_id, presence: true
  # validates :strength_id, uniqueness: { scope: :job_offer_id }
end
