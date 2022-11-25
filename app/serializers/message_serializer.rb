require 'json_serializer'

class MessageSerializer < JsonSerializer
  attribute :id
  attribute :content
  attribute :sender, :MessageSenderSerializer
  attribute :created_at

  def sender
    object.conversation_participant.user.profile
  end
end