class Hunt < ApplicationRecord
  enum state: [:given, :student_liked_back, :student_rejected]

  belongs_to :company_profile
  belongs_to :student_profile

  validates :company_profile_id, presence: true
  validates :student_profile_id, presence: true, uniqueness: { 
    scope: :company_profile_id 
  }
end
