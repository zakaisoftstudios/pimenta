require 'json_serializer'

class JobOfferSerializer < JsonSerializer
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
  attribute :free_places
  attribute :state
  attribute :working_hours_per_week
  attribute :minimum_degree
  attribute :wage_period
  attribute :street
  attribute :web_site_link
  attribute :job_offer_skills,              :JobOfferSkillSerializer
  attribute :job_offer_interests,           :JobOfferInterestSerializer
  attribute :job_offer_strengths,           :JobOfferStrengthSerializer
  attribute :company_profile_id
  attribute :company_profile,               :CompanyProfileSerializer
  attribute :attachments,                   :AttachmentSerializer
  attribute :created_at
  attribute :total_items_count

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
