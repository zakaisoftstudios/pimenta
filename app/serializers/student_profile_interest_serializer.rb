require 'json_serializer'

class StudentProfileInterestSerializer < JsonSerializer
  attribute :id
  attribute :student_profile_id
  attribute :interest, :InterestSerializer
end
