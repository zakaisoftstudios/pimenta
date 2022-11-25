require 'json_serializer'

class WorkExperienceSerializer < JsonSerializer
  attribute :id
  attribute :from
  attribute :to
  attribute :company_name
  attribute :kind
  attribute :title
  attribute :company_name
  attribute :department
  attribute :city
  attribute :country
  attribute :student_profile_id
  attribute :tasks

  def from
    Nxt::Util::Date.api_format(object.from)
  end

  def to
    Nxt::Util::Date.api_format(object.to)
  end
end
