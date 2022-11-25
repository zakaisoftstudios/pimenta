class ConversationMessageBlueprint < Blueprinter::Base
  identifier :id
  fields :content, :created_at

  field(:sender_user_id) do |message, options|
    message.sender.user.id
  end
end
