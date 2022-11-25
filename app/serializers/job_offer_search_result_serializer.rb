require 'json_serializer'

class JobOfferSearchResultSerializer < JsonSerializer
  attribute :id
  attribute :category
  attribute :content
  attribute :what_is_expected_from_you
  attribute :what_is_expected_from_us
  attribute :tasks
  attribute :perspectives
  attribute :city
  attribute :country
  attribute :postal_code
  attribute :start
  attribute :end_date
  attribute :wage
  attribute :working_hours_per_week
  attribute :free_places
  attribute :job_offer_skills,    :JobOfferSkillSerializer
  attribute :job_offer_interests, :JobOfferInterestSerializer
  attribute :job_offer_strengths, :JobOfferStrengthSerializer
  attribute :company_profile,     :CompanyProfileSerializer
  attribute :distance
  attribute :match_percentage
  attribute :wage_period
  attribute :like,                :LikeSerializer
  attribute :attachments,         :AttachmentSerializer
  attribute :minimum_degree
  attribute :total_items_count
  attribute :job_like_status
  attribute :web_site_link

  def wage
    ('%.2f' % object.wage).to_f if object.wage
  end

  def start
    Nxt::Util::Date.api_format(object.start)
  end

  def end_date
    Nxt::Util::Date.api_format(object.end_date)
  end
end