module Nxt
  module Company
    module Hunting
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
        :student_profile_skills,
        :student_profile_interests,
        :student_profile_strengths,
        :speciality,
        :highest_graduation_level,
        :current_job_status,
        :area_of_graduation,
        :attachments

        attr_reader :company_profile,
          :student_profile, 
          :filters

        attr_accessor :total_items_count

        def initialize(student_profile:, company_profile:, filters:)
          @student_profile = student_profile
          @company_profile = company_profile
          @filters = filters
        end

        def distance
          student_profile.distance_to(company_profile)
        end

        def hunt_status
          Nxt::Match::HuntStatus.new(
            student_profile: student_profile,
            company_profile: company_profile
          ).get
        end

        def hunt
          company_profile.hunts.where(student_profile: student_profile).first
        end

        def student_likes
          student_profile
          .likes
          .for_company(company_profile)
          .not_rejected
        end
      end
    end
  end
end