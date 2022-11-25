class JobOfferSkill < ApplicationRecord
  belongs_to :job_offer, optional: true
  belongs_to :skill

  validates :skill_id, presence: true
end
