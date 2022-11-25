class Conversation < ApplicationRecord
  belongs_to :student_profile
  belongs_to :company_profile
  has_many :messages, class_name: :ConversationMessage, dependent: :destroy

  validates :student_profile,
    presence: true,
    uniqueness: {scope: :company_profile}

  validates :company_profile,
    presence: true,
    uniqueness: {scope: :student_profile}

  validates_associated :messages
end
