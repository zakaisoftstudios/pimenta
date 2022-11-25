class StudentProfileStrength < ApplicationRecord
  belongs_to :student_profile
  belongs_to :strength

  validates :student_profile_id, presence: true
  validates :strength_id, presence: true
  validates :strength_id, uniqueness: { scope: :student_profile_id }
end
