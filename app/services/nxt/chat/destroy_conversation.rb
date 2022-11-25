module Nxt
  module Chat
    class DestroyConversation
      def initialize(conversation:)
        @conversation = conversation
      end

      def call
        ActiveRecord::Base.transaction do
          @conversation.company_profile.hunts.where(
            student_profile: @conversation.student_profile
          ).destroy_all

          @conversation.student_profile.likes.for_company(
            @conversation.company_profile
          ).destroy_all

          @conversation.destroy
        end
      end
    end
  end
end