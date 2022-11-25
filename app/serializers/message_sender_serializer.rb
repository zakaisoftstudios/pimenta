require 'json_serializer'

class MessageSenderSerializer < JsonSerializer
  attribute :id
  attribute :user_id
  attribute :name
  attribute :graduation
  attribute :attachments,     :AttachmentSerializer

  def user_id
    object.user.id
  end

  def graduation
    object.graduation if object.respond_to?(:graduation)
  end
end