require 'json_serializer'

class SkillSerializer < JsonSerializer
  attribute :id
  attribute :label
  attribute :value
end
