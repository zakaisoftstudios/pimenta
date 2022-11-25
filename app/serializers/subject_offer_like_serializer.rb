require 'json_serializer'

class SubjectOfferLikeSerializer < JsonSerializer
  attribute :id
  attribute :student_profile_id
  attribute :company_profile_id
  attribute :subject_offer_id
  attribute :subject_offer, :SubjectOfferSerializer
  attribute :created_at
  attribute :match_percentage

  def match_percentage
    return if object.company_profile_id.present?
    Nxt::Student::Search::MatchingPercentage.new(
      profile: object.student_profile,
      offer: object.subject_offer,
      offer_key: :subject_offer
    ).calculate
  end
end
