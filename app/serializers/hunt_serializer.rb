require 'json_serializer'

class HuntSerializer < JsonSerializer
  attribute :id
  attribute :student_profile_id
  attribute :company_profile_id
  attribute :created_at
  attribute :student_profile, :StudentProfileSerializer
  attribute :state
  attribute :hunt_status

  def hunt_status
    Nxt::Match::HuntStatus.new(
      student_profile: object.student_profile,
      company_profile: object.company_profile
    ).get
  end
end
