require 'json_serializer'

class StudentConversationSerializer < JsonSerializer
  attribute :id
  attribute :owner_user_id
  attribute :partner_user_id
  attribute :partner_name
  attribute :partner_pic
  attribute :partner_description
  attribute :partner_profile, :CompanyProfileSerializer

  def owner_user_id
    object.student_profile.user.id
  end

  def partner_user_id
    object.company_profile.user.id
  end

  def partner_name
    object.company_profile.name
  end

  def partner_pic
    object.company_profile.attachments.avatar.last.picture.url
  end

  def partner_description
    object.company_profile.industry_sector
  end  

  def partner_profile
    object.company_profile
  end
end