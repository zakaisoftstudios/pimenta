require 'json_serializer'

class SubjectOfferInterestSerializer < JsonSerializer
  attribute :id
  attribute :must_have
  attribute :interest, :InterestSerializer
end
