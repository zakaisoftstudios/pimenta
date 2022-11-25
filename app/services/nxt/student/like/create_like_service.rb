module Nxt
  module Student
    module Like
      class CreateLikeService
        def initialize(student_profile:, job_offer:)
          @job_offer = job_offer
          @student_profile = student_profile
        end
  
        def call
          ActiveRecord::Base.transaction do
            like = create_like
            conversations.create
            like
          end
        end
  
        private
  
        def create_like
          @student_profile.likes.create!(
            job_offer: @job_offer
          )
        end

        def conversations
          Nxt::Chat::Conversations.new(
            student_profile: @student_profile,
            company_profile: @job_offer.company_profile
          )
        end
      end
    end
  end
end