module Nxt
  module Chat
    class Conversations
      def initialize(company_profile:, student_profile:)
        @company_profile = company_profile
        @student_profile = student_profile
      end

      def create
        if match_verifier.has_match? && !existant_conversation.present?
          conversation = create_conversation
          send_new_conversation_notifications(conversation)
          conversation
        end
      end

      def destroy
        existant_conversation.destroy if existant_conversation.present? &&
          !match_verifier.has_match?
      end

      private

      def send_new_conversation_notifications(conversation)
        Nxt::Notification::NewConversation.new(
          conversation: conversation
        ).notificate_participants
      end

      def create_conversation
        ::Conversation.create!(
          student_profile: @student_profile,
          company_profile: @company_profile
        )
      end

      def existant_conversation
        @existant_conversation ||= ::Conversation.find_by(
          company_profile: @company_profile, 
          student_profile: @student_profile
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