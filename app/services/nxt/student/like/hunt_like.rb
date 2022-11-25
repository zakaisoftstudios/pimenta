module Nxt
  module Student
    module Like
      class HuntLike
        def initialize(hunt:)
          @hunt = hunt
        end

        def create
          ActiveRecord::Base.transaction do
            @hunt.student_liked_back!
            conversations.create
            @hunt
          end
        end
        
        def destroy
          ActiveRecord::Base.transaction do
            @hunt.destroy
            conversations.destroy
            @hunt
          end
        end

        private

        def conversations
          Nxt::Chat::Conversations.new(
            student_profile: @hunt.student_profile,
            company_profile: @hunt.company_profile
          )
        end
      end
    end
  end  
end