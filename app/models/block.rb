class Block < ApplicationRecord
  belongs_to :student_profile
  belongs_to :company_profile

  validates :student_profile_id, uniqueness: { scope: :company_profile_id }
  validates :company_profile_id, uniqueness: { scope: :student_profile_id }
end
