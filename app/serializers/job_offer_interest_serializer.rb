require 'json_serializer'

class JobOfferInterestSerializer < JsonSerializer
  attribute :id
  attribute :must_have
  attribute :interest, :InterestSerializer
end
