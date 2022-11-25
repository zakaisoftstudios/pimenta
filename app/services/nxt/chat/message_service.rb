require 'json'

module Nxt
  module Chat
    class MessageService
      def initialize(conversation:, sender:, content:)
        @conversation = conversation
        @sender = sender
        @content = content
      end

      def create
        ActiveRecord::Base.transaction do
          message = create_message
          send_to_party(message)
          message
        end
      end

      private

      def create_message
        @conversation.messages.create!(sender: @sender, content: @content)
      end

      def send_to_party(message)
        json_payload = ConversationMessageBlueprint.render(message)
        hash_payload = JSON.parse(json_payload)

        SendNewChatMessageJob.perform_later(@conversation, hash_payload)
      end
    end
  end
end