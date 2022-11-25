module Nxt
  module Company
    module LikedFrom
      class Result
        extend Forwardable
        def_delegators :@student_profile,
        :id,
        :name,
        :date_of_birth,
        :gender,
        :country,
        :city,
        :postal_code,
        :street,
        :graduation,
        :grade_point_average,
        :available_from,
        :driving_license,
        :mobility,
        :other_skills_and_interests,
        :certificates,
        :education_entries,
        :work_experiences,
        :age,
        :highest_graduation_level,
        :current_job_status,
        :area_of_graduation,
        :student_profile_skills,
        :student_profile_interests,
        :student_profile_strengths,
        :attachments

        attr_reader :student_likes

        def initialize(student_profile:, company_profile:, student_likes:)
          @student_profile = student_profile
          @student_likes = student_likes
          @company_profile = company_profile
        end

        def like_status
          Nxt::Match::LikeStatus.new(
            student_profile: @student_profile,
            company_profile: @company_profile
          ).get
        end
      end
    end 
  end
end