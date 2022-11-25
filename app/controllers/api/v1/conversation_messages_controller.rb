module Api
  module V1
    class ConversationMessagesController < ApiController
      before_action :authenticate_user
      before_action :set_conversation
      before_action :set_conversation_message_service, only: :create

      def index
        messages = @conversation.messages
        json = ConversationMessageBlueprint.render(messages)

        render json: json
      end

      def create
        message = @message_service.create
        json = ConversationMessageBlueprint.render(message)

        render json: json, status: :created
      end

      private

      def conversation_message_params
        params.require(:conversation_message).permit(:content)
      end

      def set_conversation
        @conversation = current_user.profile.conversations.find(
          params[:conversation_id]
        )
      end

      def set_conversation_message_service
        @message_service = Nxt::Chat::MessageService.new(
          conversation: @conversation,
          sender: current_user.profile,
          content: conversation_message_params[:content]
        )
      end
    end
  end 
end