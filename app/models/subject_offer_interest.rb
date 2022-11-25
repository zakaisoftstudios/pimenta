class SubjectOfferInterest < ApplicationRecord
  belongs_to :subject_offer
  belongs_to :interest

  validates :interest_id, presence: true
end
