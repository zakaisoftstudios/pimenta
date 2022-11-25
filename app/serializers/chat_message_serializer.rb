require 'json_serializer'

class ChatMessageSerializer < JsonSerializer
  attribute :id
  attribute :content
  attribute :created_at
  attribute :sender_id
  attribute :sender_name
  attribute :sender_picture
  attribute :conversation_id


  def sender_id
    object.conversation_participant.user.id
  end

  def sender_name
    object.conversation_participant.user.profile.name
  end

  def sender_picture
    object.conversation_participant.user.profile.try(:picture).try(:url)
  end

  def sender_attachments
    object.conversation_participant.user.profile.attachments
  end

  def conversation_id
    object.conversation_participant.conversation.id
  end
end