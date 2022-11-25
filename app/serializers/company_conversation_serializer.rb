require 'json_serializer'

class CompanyConversationSerializer < JsonSerializer
  attribute :id
  attribute :owner_user_id
  attribute :partner_user_id
  attribute :partner_name
  attribute :partner_pic
  attribute :partner_description
  attribute :partner_profile, :StudentProfileSerializer

  def owner_user_id
    object.company_profile.user.id
  end

  def partner_user_id
    object.student_profile.user.id
  end

  def partner_name
    object.student_profile.name
  end

  def partner_pic
    object.student_profile.attachments.avatar.last.picture.url
  end

  def partner_description
    object.student_profile.graduation
  end  

  def partner_profile
    object.student_profile
  end
end