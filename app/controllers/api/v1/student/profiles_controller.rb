module Api
  module V1
    module Student
      class ProfilesController < ApiController
        before_action :authenticate_user

        def show
          json(StudentProfileSerializer.new(profile))
        end

        def update
          profile.update!(profile_params)
          json(StudentProfileSerializer.new(profile))
        end

        private

        def profile_params
          params.require(:profile).permit(
            :name,
            :date_of_birth,
            :gender,
            :country,
            :city,
            :postal_code,
            :latitude,
            :longitude,
            :street,
            :graduation,
            :grade_point_average,
            :available_from,
            :driving_license,
            :mobility,
            :educational_level,
            :other_skills_and_interests,
            :video,
            :speciality,
            :current_job_status,
            :highest_graduation_level,
            :area_of_graduation,
            :certificates_attributes => [
              :id,
              :student_profile_id,
              :pdf,
              :title,
              :finished_at,
              :institution_name,
              :_destroy
            ],
            :education_entries_attributes => [
              :id,
              :student_profile_id,
              :from,
              :to,
              :school_name,
              :city,
              :country,
              :grade_point_average,
              :educational_level,
              :course,
              :area_of_graduation,
              :_destroy
            ],
            :work_experiences_attributes => [
              :id,
              :student_profile_id,
              :from,
              :to,
              :company_name,
              :city,
              :country,
              :kind,
              :title,
              :company_name,
              :department,
              :tasks,
              :_destroy
            ],
            :student_profile_skills_attributes => [
              :id,
              :student_profile_id,
              :skill_id,
              :_destroy
            ],
            :student_profile_interests_attributes => [
              :id,
              :student_profile_id,
              :interest_id,
              :_destroy
            ],
            :student_profile_strengths_attributes => [
              :id,
              :student_profile_id,
              :strength_id,
              :_destroy
            ]
          ).merge(profile_complete: true)
        end

        def profile
          @profile = current_user.profile
        end
      end
    end
  end
end