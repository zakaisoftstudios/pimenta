require 'json_serializer'

class HuntedBySerializer < JsonSerializer
  attribute :id
  attribute :state
  attribute :company_profile, :CompanyProfileSerializer
  attribute :created_at
  attribute :hunt_status
  attribute :job_offers, :JobOfferSerializer
  
  def job_offers
    object.company_profile.job_offers
  end

  def hunt_status
    Nxt::Match::HuntStatus.new(
      student_profile: object.student_profile,
      company_profile: object.company_profile
    ).get
  end
end