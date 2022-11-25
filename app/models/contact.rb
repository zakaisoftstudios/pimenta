class Contact
  include ActiveModel::Model
  attr_accessor :sender_name, :sender_email, :subject, :message

  validates :sender_name, presence: true
end