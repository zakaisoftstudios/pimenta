require 'json_serializer'

class SubjectOfferStrengthSerializer < JsonSerializer
  attribute :id
  attribute :must_have
  attribute :strength, :StrengthSerializer
end
