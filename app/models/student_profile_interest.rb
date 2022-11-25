class StudentProfileInterest < ApplicationRecord
  belongs_to :interest
  belongs_to :student_profile

  validates :interest_id, presence: true
  validates :student_profile_id, presence: true
  validates :interest_id, uniqueness: { scope: :student_profile_id }
end
