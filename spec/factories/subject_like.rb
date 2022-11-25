FactoryBot.define do
  factory :subject_like do
    subject_offer { create(:subject_offer) }
    student_profile { nil }
    company_profile { create(:company_profile) }
  end
end
