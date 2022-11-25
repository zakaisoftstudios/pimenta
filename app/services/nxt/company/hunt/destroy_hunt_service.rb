module Nxt
  module Company
    module Hunt
      class DestroyHuntService
        def initialize(hunt:)
          @hunt = hunt
        end
  
        def call
          ActiveRecord::Base.transaction do
            @hunt.destroy
            conversations.destroy
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