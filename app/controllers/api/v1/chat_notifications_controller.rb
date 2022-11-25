module Api
  module V1
    class ChatNotificationsController < ApiController
      before_action :authenticate_user

      def destroy
        reset_chat_notifications
        json({}, :no_content)
      end

      private

      def reset_chat_notifications
        Nxt::Notification::UserChat.new(user: current_user).reset_and_notificate
      end
    end
  end
end