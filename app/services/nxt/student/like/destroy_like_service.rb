module Nxt
  module Student
    module Like
      class DestroyLikeService
        def initialize(like:)
          @like = like
        end
  
        def call
          ActiveRecord::Base.transaction do
            @like.destroy
            conversations.destroy if can_destroy_conversation?
          end
        end
  
        private

        def can_destroy_conversation?
          given_likes = ::Like
            .for_company(@like.job_offer.company_profile)
            .received_from(@like.student_profile)
          
          given_likes.none? &&        !match_verifier.did_student_like_back_a_company_hunt?
        end

        def conversations
          Nxt::Chat::Conversations.new(
            student_profile: @like.student_profile,
            company_profile: @like.job_offer.company_profile
          )
        end

        def match_verifier
          Nxt::Match::Verifier.new(
            student_profile: @like.student_profile, 
            company_profile: @like.job_offer.company_profile
          )
        end
      end
    end
  end
end