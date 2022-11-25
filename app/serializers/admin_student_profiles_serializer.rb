require 'json_serializer'

class AdminStudentProfilesSerializer < JsonSerializer
  attribute :id
  attribute :name
  attribute :email
  attribute :created_at
  attribute :date_of_birth
  attribute :gender
  attribute :country
  attribute :city
  attribute :postal_code
  attribute :total_items_count
  attribute :street
  attribute :graduation
  attribute :grade_point_average
  attribute :available_from
  attribute :driving_license
  attribute :mobility
  attribute :other_skills_and_interests
  attribute :age
  attribute :video
  attribute :speciality
  attribute :highest_graduation_level
  attribute :area_of_graduation
  attribute :current_job_status
  attribute :profile_complete
  attribute :student_profile_skills,    :StudentProfileSkillSerializer
  attribute :student_profile_interests, :StudentProfileInterestSerializer
  attribute :student_profile_strengths, :StudentProfileStrengthSerializer
  attribute :interests,                 :InterestSerializer
  attribute :strengths,                 :StrengthSerializer
  attribute :certificates,              :CertificateSerializer
  attribute :education_entries,         :EducationEntrySerializer
  attribute :work_experiences,          :WorkExperienceSerializer
  attribute :attachments,               :AttachmentSerializer
  attribute :student_likes,             :LikeSerializer

  def date_of_birth
    Nxt::Util::Date.api_format(object.date_of_birth)
  end

  def available_from
    Nxt::Util::Date.api_format(object.available_from)
  end

  def driving_license
    object.driving_license ? 'true' : 'false'
  end

  def email
    object.user && object.user.email
  end
end
