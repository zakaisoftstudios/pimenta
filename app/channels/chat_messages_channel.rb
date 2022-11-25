class ChatMessagesChannel < ApplicationCable::Channel
  def subscribed
    p "#{current_user.profile.name} connected to ChatMessagesChannel for conversation #{params[:conversation_id]}"
    
    stream_for conversation
    # define_joined(true)
  end

  def unsubscribed
    # define_joined(false)
  end

  private
  attr_reader :conversation, :participant

  def define_joined(status)
    participant.update(joined: status)
  end

  def participant
    @participant ||= ConversationParticipant.from_user(
      current_user, 
      conversation
    )
  end

  def conversation
    @conversation ||= Conversation.find(params[:conversation_id])
  end
end