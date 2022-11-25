module Api
  module V1
    module Company
      class LikedFromController < ApiController
        before_action :authenticate_user

        def index
          json(LikedFromSerializer.new(student_likes))
        end

        def destroy
          like_back_service.destroy
          json({}, :no_content)
        end

        private

        def like_back_service
          student_profile = StudentProfile.find(params[:id])

          Nxt::Company::Like::LikeBack.new(
            company_profile: current_user.profile,
            student_profile: student_profile
          )
        end

        def student_likes
          @student_likes ||= Nxt::Company::LikedFrom::Finder.new(
            company_profile: current_user.profile
          ).student_likes
        end
      end
    end
  end
end