require 'json_serializer'

class StudentProfileStrengthSerializer < JsonSerializer
  attribute :id
  attribute :student_profile_id
  attribute :strength, :StrengthSerializer
end
