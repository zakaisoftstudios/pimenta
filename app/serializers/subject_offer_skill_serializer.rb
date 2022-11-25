require 'json_serializer'

class SubjectOfferSkillSerializer < JsonSerializer
  attribute :id
  attribute :must_have
  attribute :skill, :SkillSerializer
end
