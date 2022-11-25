require 'json_serializer'

class SubjectOfferLikedFromSerializer < JsonSerializer
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
  attribute :mobility
  attribute :other_skills_and_interests
  attribute :age
  attribute :highest_graduation_level
  attribute :current_job_status
  attribute :area_of_graduation
  attribute :attachments,         :AttachmentSerializer
  attribute :student_profile_skills,              :StudentProfileSkillSerializer
  attribute :student_profile_interests,           :StudentProfileInterestSerializer
  attribute :student_profile_strengths,           :StudentProfileStrengthSerializer
  attribute :education_entries,                   :EducationEntrySerializer
  attribute :work_experiences,                    :WorkExperienceSerializer
  attribute :certificates,                        :CertificateSerializer
  attribute :student_likes,                       :SubjectOfferLikeSerializer
  # attribute :web_site_link

  def date_of_birth
    Nxt::Util::Date.api_format(object.date_of_birth)
  end

  def available_from
    Nxt::Util::Date.api_format(object.available_from)
  end
end