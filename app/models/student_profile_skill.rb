class StudentProfileSkill < ApplicationRecord
  belongs_to :student_profile
  belongs_to :skill

  validates :student_profile_id, presence: true
  validates :skill_id, presence: true
  validates :skill_id, uniqueness: { scope: :student_profile_id }
end
