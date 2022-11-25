class JobOfferInterest < ApplicationRecord
  belongs_to :job_offer, optional: true
  belongs_to :interest

  validates :interest_id, presence: true
  # validates :interest_id, uniqueness: { scope: :job_offer_id }
end
