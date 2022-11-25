require 'json_serializer'

class EducationEntrySerializer < JsonSerializer
  attribute :id
  attribute :from
  attribute :to
  attribute :school_name
  attribute :city
  attribute :country
  attribute :grade_point_average
  attribute :educational_level
  attribute :course
  attribute :area_of_graduation

  def from
    Nxt::Util::Date.api_format(object.from)
  end

  def to
    Nxt::Util::Date.api_format(object.to)
  end
end
