require 'json_serializer'

class JobOfferStrengthSerializer < JsonSerializer
  attribute :id
  attribute :must_have
  attribute :strength, :StrengthSerializer
end
