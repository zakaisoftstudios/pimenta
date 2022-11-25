module Api
  module V1
    module University
      class ProfilesController < ApiController
        before_action :authenticate_user

        def update
          profile.update!(profile_params)
          
          json(UniversityProfileSerializer.new(profile))
        end

        def show
          json(UniversityProfileSerializer.new(profile))
        end

        private

        def profile_params
          params.require(:profile).permit(
            :name,
            :type_of_university,
            :number_of_students,
            :we_are,
            :why_should_you_study_here,
            :subject_areas,
            :special_features,
            :country,
            :city,
            :street,
            :postal_code,
            :latitude,
            :longitude,
            :home_page,
            :youtube_link,
            :facebok_link,
            :twitter_link,
            :contact_email,
            :attachments_attributes => [
              :id,
              :picture,
              :video,
              :purpose
            ]
          ).merge(profile_complete: true)
        end

        def profile
          current_user.profile
        end
      end
    end
  end
end