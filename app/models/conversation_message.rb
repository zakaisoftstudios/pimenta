class ConversationMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, polymorphic: true

  validates :content, presence: true
  validates :conversation, presence: true
  validates :sender, presence: true
  # validate :valid_sender

  # def valid_sender
  #   errors.add(:sender, 'Sender is not part of the conversation') if (
  #     sender.id != conversation.company_profile.id || 
  #     sender.id != conversation.student_profile.id
  #   ) 
  # end

  scope :most_recent, -> {
    order(:created_at)
  }
end
