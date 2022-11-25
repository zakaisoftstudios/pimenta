require 'json_serializer'

class StrengthSerializer < JsonSerializer
  attribute :id
  attribute :label
  attribute :value
end
