module Nxt
  module Company
    module Like
      class LikeBack
        def initialize(company_profile:, student_profile:)
          @company_profile = company_profile
          @student_profile = student_profile
        end

        def create
          ActiveRecord::Base.transaction do
            likes.update_all(state: ::Like.states[:company_liked_back])
            conversations.create
            likes
          end
        end

        def destroy
          ActiveRecord::Base.transaction do
            likes.destroy_all

            conversations.destroy if !match_verifier.did_student_like_back_a_company_hunt?
          end
        end

        private

        def likes
          @likes ||= ::Like
            .for_company(@company_profile)
            .received_from(@student_profile)
        end

        def conversations
          Nxt::Chat::Conversations.new(
            student_profile: @student_profile,
            company_profile: @company_profile
          )
        end

        def match_verifier
          Nxt::Match::Verifier.new(
            student_profile: @student_profile, 
            company_profile: @company_profile
          )
        end
      end
    end
  end  
end