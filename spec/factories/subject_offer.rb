FactoryBot.define do
  factory :subject_offer do
    name { "Test Class 61" }
    type_of_degree { "certificate" }
    content { "content" }
    perspectives { "perspectives" }
    tests { "tests" }
    postal_code { "postal_code" }
    country { "Vereinigte Arabische Emirate" }
    city { "Al Muteena" }
    street { "123" }
    latitude { 25.2713704831557 }
    longitude { 55.3166502417433 }
    start_dates { [DateTime.now + 1.year, DateTime.now + 1.month, DateTime.now] }
    duration_in_hours { 12 }
    cost_period { "hourly" }
    cost_amount { 12.0 }
    hours_of_classes_per_week { 12 }
    number_of_places { 12 }
    minimum_degree { "bachelor" }
    state { "published" }
    university_profile { create(:university_profile) }
    nummerus_clausus { 12.0 }

    attachments  { [
      Attachment.create!(picture: nil, purpose: :main),
      Attachment.create!(picture: nil, purpose: :regular),
      Attachment.create!(picture: nil, purpose: :regular),
      Attachment.create!(video: nil, purpose: :regular),
      Attachment.create!(purpose: :video),
    ] }

    subject_offer_skills { [
      SubjectOfferSkill.new(skill: create(:skill), must_have: true),
      SubjectOfferSkill.new(skill: create(:skill))]
    }

    subject_offer_interests { [
      SubjectOfferInterest.new(interest: create(:interest), must_have: true),
      SubjectOfferInterest.new(interest: create(:interest))
    ] }

    subject_offer_strengths { [
      SubjectOfferStrength.new(strength: create(:strength), must_have: true),
      SubjectOfferStrength.new(strength: create(:strength))
    ] }
  end
end
