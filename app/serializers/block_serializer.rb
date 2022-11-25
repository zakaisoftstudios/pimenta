require 'json_serializer'

class BlockSerializer < JsonSerializer
  attribute :id
  attribute :company_profile_id
  attribute :student_profile_id
end
