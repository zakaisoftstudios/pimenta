module Api
  module V1
    # controller to handle the subject likes from the Student and Company Profiles
    class SubjectLikesController < ApiController
      before_action :authenticate_user

      def index
        subject_likes = current_user.profile.subject_likes
        json(SubjectOfferLikeSerializer.new(subject_likes))
      end

      def create
        subject_like = create_subject_like_service.call
        json(SubjectOfferLikeSerializer.new(subject_like))
      end

      def destroy
        subject_like = current_user.profile.subject_likes.find(params[:id])
        subject_like.destroy

        json({}, :no_content)
      end

      private

      def subject_like_params
        params.require(:subject_like).permit(:subject_offer_id)
      end

      def create_subject_like_service
        subject_offer = SubjectOffer.find(
          subject_like_params[:subject_offer_id]
        )

        Nxt::SubjectLike::CreateSubjectLike.new(
          profile: current_user.profile,
          subject_offer: subject_offer
        )
      end
    end
  end
end