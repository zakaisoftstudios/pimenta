module Api
  module V1
    module Student
      class LikesController < ApiController
        before_action :authenticate_user
        before_action :set_destroy_like_service, only: :destroy
        before_action :set_likes, only: :index
        before_action :set_create_like_service, only: :create

        def index
          json(LikeSerializer.new(@likes))
        end

        def create
          like = @create_like_service.call
          json = LikeBlueprint.render(like)

          render(json: json, status: :created)
        end

        def destroy
          @destroy_like_service.call
          json({}, :no_content)
        end

        private

        def like_params
          params.require(:like).permit(:job_offer_id)
        end

        def set_create_like_service
          job_offer = JobOffer.find(like_params[:job_offer_id])

          @create_like_service ||= Nxt::Student::Like::CreateLikeService.new(
            student_profile: current_user.profile,
            job_offer: job_offer
          )
        end

        def set_destroy_like_service
          like = Like.find(params[:id])

          @destroy_like_service ||= Nxt::Student::Like::DestroyLikeService.new(
            like: like
          )
        end

        def set_likes
          @likes = current_user.profile.likes
        end        
      end
    end
  end
end