require 'json_serializer'

class InterestSerializer < JsonSerializer
  attribute :id
  attribute :label
  attribute :value
end
