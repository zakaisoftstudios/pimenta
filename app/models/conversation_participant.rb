class ConversationParticipant < ApplicationRecord
  belongs_to :conversation, inverse_of: :participants
  belongs_to :user

  has_many :messages,
    class_name: :ConversationMessage,
    foreign_key: :conversation_participant_id,
    dependent: :destroy

  validates :conversation, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :conversation_id }

  scope :partner, -> (requester) {
    where.not(user: requester).first
  }

  scope :from_user, -> (user, conversation) {
    find_by(
      conversation: conversation,
      user: user
    )
  }

  def create_message!(content)
    messages.create!(content: content)
  end
end
