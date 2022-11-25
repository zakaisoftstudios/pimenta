class ChatConversationChannel < ApplicationCable::Channel
  def subscribed
    p "#{current_user.profile.name} connected to ChatConversationChannel for conversation #{params[:conversation_id]}"
    
    stream_for conversation
  end
end