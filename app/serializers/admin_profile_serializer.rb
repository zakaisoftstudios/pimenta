require 'json_serializer'

class AdminProfileSerializer < JsonSerializer
  attribute :id
  attribute :name
  attribute :email

  def email
    object.user.email
  end
end
