class CompanyConversationBlueprint < Blueprinter::Base
  identifier :id

  field(:owner_user_id) do |conversation, options|
    conversation.company_profile.user.id
  end

  field(:partner_user_id) do |conversation, options|
    conversation.student_profile.user.id
  end

  field(:partner_name) do |conversation, options|
    conversation.student_profile.name
  end

  field(:partner_pic) do |conversation, options|
    conversation.student_profile.attachments.avatar.last.picture.url
  end

  field(:partner_description) do |conversation, options|
    conversation.student_profile.graduation
  end
end