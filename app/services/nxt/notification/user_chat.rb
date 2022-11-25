module Nxt
  module Notification
    class UserChat
      def initialize(user:)
        @user = user
      end

      def reset_and_notificate
        reset
        notificate
      end

      def reset
        user.update(chat_notifications_count: 0)
      end

      def notificate
        SendChatNotificationJob.perform_later(
          user, 
          { count: user.chat_notifications_count }
        )
      end

      private
      attr_reader :user
    end
  end
end