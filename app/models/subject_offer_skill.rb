class SubjectOfferSkill < ApplicationRecord
  belongs_to :subject_offer, optional: true
  belongs_to :skill

  validates :skill_id, presence: true
end
