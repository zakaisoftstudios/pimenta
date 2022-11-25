require 'json_serializer'

class UserSerializer < JsonSerializer
  attribute :id
  attribute :email
  attribute :profile_type
  attribute :chat_notifications_count
  attribute :profile, :ProfileSerializer
  attribute :email_confirmed
  attribute :facebook_id

  def initialize(object, token)
    super(object)
    @token = token
  end

  def to_hash
    hash = super
    hash.merge!(jwt: @token)
    hash
  end
end
