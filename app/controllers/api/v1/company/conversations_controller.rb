module Api
  module V1
    module Company
      class ConversationsController < ApiController
        before_action :authenticate_user
        
        def index
          conversations = current_user.profile.conversations
          json(CompanyConversationSerializer.new(conversations))
        end

        def destroy
          destroy_conversation_service.call
          json({}, :no_content)
        end

        private

        def destroy_conversation_service
          conversation = Conversation.find(params[:id])

          @destroy_conversation_service ||= Nxt::Chat::DestroyConversation.new(
            conversation: conversation
          )
        end
      end
    end
  end 
end