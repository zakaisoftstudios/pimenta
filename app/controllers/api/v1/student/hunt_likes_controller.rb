module Api
  module V1
    module Student
      class HuntLikesController < ApiController
        before_action :authenticate_user
        
        def create
          hunt = hunt_like_service.create
          json(HuntedBySerializer.new(hunt))
        end

        def destroy
          hunt = hunt_like_service.destroy
          json(HuntedBySerializer.new(hunt))
        end

        private

        def hunt_like_service
          hunt = current_user.profile.hunted_by.find(params[:hunt_id])
          @hunt_like_service ||= Nxt::Student::Like::HuntLike.new(hunt: hunt)
        end
      end
    end
  end
end