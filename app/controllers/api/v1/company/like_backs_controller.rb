module Api
  module V1
    module Company
      class LikeBacksController < ApiController
        before_action :authenticate_user
        
        def create
          likes = like_back_service.create
          json(LikeSerializer.new(likes), :created)
        end

        private

        def like_back_service
          student_profile = StudentProfile.find(params[:student_profile_id])

          Nxt::Company::Like::LikeBack.new(
            company_profile: current_user.profile,
            student_profile: student_profile
          )
        end
      end
    end
  end
end