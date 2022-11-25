class SendNewChatMessageJob < ApplicationJob
  queue_as :default

  def perform(conversation, payload)
    ChatMessagesChannel.broadcast_to(conversation, payload)
  end
end