require 'json_serializer'

class StudentProfileSkillSerializer < JsonSerializer
  attribute :id
  attribute :student_profile_id
  attribute :skill, :SkillSerializer
end
