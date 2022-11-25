module Api
  module V1
    module University
      class LikedFromController < ApiController
        before_action :authenticate_user

        def index
          likes = likes_finder_service.call
          json(SubjectOfferLikedFromSerializer.new(likes))
        end

        private

        def likes_finder_service
          @likes_finder_service ||= Nxt::University::LikedFrom::Finder.new(
            university_profile: current_user.profile
          )
        end
      end
    end
  end
end