class SubjectLike < ApplicationRecord
  belongs_to :subject_offer, optional: false
  belongs_to :student_profile
  belongs_to :company_profile

  after_create :must_have_only_one_profile

  def must_have_only_one_profile
    return true if (student_profile.present? && company_profile.nil?) || (student_profile.nil? && company_profile.present?)
    raise Nxt::SubjectLike::Errors::MustHaveOnlyOneProfile, 'Subject like must have exactly one profile'
  end

  validates :subject_offer, uniqueness: {
    scope: [:student_profile, :company_profile]
  }
end
