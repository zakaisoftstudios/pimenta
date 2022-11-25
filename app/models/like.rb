class Like < ApplicationRecord
  enum state: [:given, :regreted, :company_liked_back, :company_rejected]

  belongs_to :student_profile
  belongs_to :job_offer

  validates :job_offer_id, presence: true, uniqueness: {
    scope: :student_profile_id
  }

  validates :student_profile_id, presence: true

  scope :for_company, -> (company_profile) {
    joins(:job_offer)
      .where(job_offers: { company_profile_id: company_profile.id })
  }

  scope :received_from, -> (student_profile) {
    where(student_profile: student_profile)
  }

  scope :not_rejected, -> {
    where.not(state: ::Like.states[:company_rejected])
  }

  scope :from_last_week, -> {
    start_date = 1.week.ago.beginning_of_day
    end_date = Time.current
    where(created_at: start_date..end_date)
  }
end
