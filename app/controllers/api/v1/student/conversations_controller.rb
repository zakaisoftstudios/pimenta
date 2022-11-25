module Api
  module V1
    module Student
      class ConversationsController < ApiController
        before_action :authenticate_user
        
        def index
          conversations = current_user.profile.conversations
          json(StudentConversationSerializer.new(conversations))
        end

        def destroy
          destroy_conversation_service.call
          json({}, :no_content)
        end

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