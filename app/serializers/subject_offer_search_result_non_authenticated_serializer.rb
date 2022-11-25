require 'json_serializer'

class SubjectOfferSearchResultNonAuthenticatedSerializer < JsonSerializer
  attribute :id
  attribute :state
  attribute :name
  attribute	:type_of_degree
  attribute	:content
  attribute	:perspectives
  attribute	:tests
  attribute	:postal_code
  attribute	:country
  attribute	:city
  attribute	:street
  attribute	:latitude
  attribute	:longitude
  attribute	:start_date
  attribute :start_dates
  attribute	:duration_in_hours
  attribute	:cost_period
  attribute	:cost_amount
  attribute	:hours_of_classes_per_week
  attribute	:number_of_places
  attribute	:nummerus_clausus
  attribute	:minimum_degree
  attribute :subject_offer_skills,    :SubjectOfferSkillSerializer
  attribute :subject_offer_interests, :SubjectOfferInterestSerializer
  attribute :subject_offer_strengths, :SubjectOfferStrengthSerializer
  attribute :university_profile,     :UniversityProfileSerializer
  attribute :attachments,         :AttachmentSerializer
  attribute :total_items_count
  attribute :web_site_link

  def cost_amount
    ('%.2f' % object.cost_amount).to_f if object.cost_amount
  end

  def start_date
    Nxt::Util::Date.api_format(object.start_date)
  end

  def start_dates
    object.start_dates.map do |start_date|
      Nxt::Util::Date.api_format(start_date)
    end
  end
end