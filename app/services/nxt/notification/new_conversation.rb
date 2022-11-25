module Nxt
  module Notification
    class NewConversation
      def initialize(conversation:)
        @conversation = conversation
      end

      def notificate_participants
        send_push_notifications
        send_emails
      end

      private

      def send_push_notifications
        ActiveRecord::Base.transaction do
          [
            @conversation.company_profile.user,
            @conversation.student_profile.user
          ].each do |user|
            user.update(
              chat_notifications_count: user.chat_notifications_count + 1
            )

            SendChatNotificationJob.perform_later(
              user, 
              { count: user.chat_notifications_count }
            )
          end
        end
      end

      def send_emails
        company = @conversation.company_profile.user
        student = @conversation.student_profile.user

        MatchMailer.new_match(
          recipient: company, matched: student
        ).deliver_later

        MatchMailer.new_match(
          recipient: student, matched: company
        ).deliver_later
      end
    end
  end
end