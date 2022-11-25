class WorkExperience < ApplicationRecord
  belongs_to :student_profile

  enum kind: [
    :mini_job, 
    :internship, 
    :aprrencticeship, 
    :trainee, 
    :full_time_job, 
    :part_time_job
  ]

  validates :title, presence: true
  validates :from, presence: true
  validates :kind, presence: true
  validates :company_name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :student_profile_id, presence: true
end
