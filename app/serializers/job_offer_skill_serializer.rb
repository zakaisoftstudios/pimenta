require 'json_serializer'

class JobOfferSkillSerializer < JsonSerializer
  attribute :id
  attribute :must_have
  attribute :skill, :SkillSerializer
end
