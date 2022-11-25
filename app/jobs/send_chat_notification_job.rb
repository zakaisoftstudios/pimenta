class SendChatNotificationJob < ApplicationJob
  queue_as :default

  def perform(receiver, payload)
    ChatNotificationsChannel.broadcast_to(receiver, payload)
  end
end
