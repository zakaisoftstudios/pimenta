require 'json_serializer'

class LikeSerializer < JsonSerializer
  attribute :id
  attribute :student_profile_id
  attribute :job_offer_id
  attribute :job_offer, :JobOfferSerializer
  attribute :state
  attribute :created_at
  attribute :job_like_status
  attribute :match_percentage

  def job_like_status
    Nxt::Match::JobLikeStatus.new(
      student_profile: object.student_profile,
      job_offer: object.job_offer
    ).get
  end

  def match_percentage
    Nxt::Student::Search::MatchingPercentage.new(
      profile: object.student_profile,
      offer: object.job_offer,
      offer_key: :job_offer
    ).calculate
  end
end
