module Api
  module V1
    module Company
      class ProfilesController < ApiController
        before_action :authenticate_user

        def update
          profile.update!(profile_params)
          
          json(CompanyProfileSerializer.new(profile))
        end

        def show
          json(CompanyProfileSerializer.new(profile))
        end

        private

        def profile_params
          params.require(:profile).permit(
            :name,
            :contact_person,
            :industry_sector,
            :number_of_employees,
            :country,
            :city,
            :postal_code,
            :latitude,
            :longitude,
            :street,
            :what_we_do,
            :why_we_do_it,
            :why_you_should_join_our_team,
            :special_features,
            :home_page,
            :youtube_link,
            :facebok_link,
            :twitter_link,
            :instagram_link,
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