require 'json_serializer'

class StudentProfileSearchResultSerializer < JsonSerializer
  attribute :id
  attribute :name
  attribute :date_of_birth
  attribute :gender
  attribute :country
  attribute :city
  attribute :postal_code
  attribute :street
  attribute :graduation
  attribute :grade_point_average
  attribute :available_from
  attribute :driving_license
  attribute :speciality
  attribute :current_job_status
  attribute :highest_graduation_level
  attribute :area_of_graduation
  attribute :driving_license
  attribute :mobility
  attribute :other_skills_and_interests
  attribute :student_profile_skills,    :StudentProfileSkillSerializer
  attribute :student_profile_interests, :StudentProfileInterestSerializer
  attribute :student_profile_strengths, :StudentProfileStrengthSerializer
  attribute :certificates,              :CertificateSerializer
  attribute :education_entries,         :EducationEntrySerializer
  attribute :work_experiences,          :WorkExperienceSerializer
  attribute :distance
  attribute :age
  attribute :hunt, :HuntSerializer
  attribute :hunt_status
  attribute :student_likes,             :LikeSerializer
  attribute :total_items_count
  attribute :attachments,               :AttachmentSerializer

  def available_from
    Nxt::Util::Date.api_format(object.available_from)
  end

  def date_of_birth
    Nxt::Util::Date.api_format(object.date_of_birth)
  end
end