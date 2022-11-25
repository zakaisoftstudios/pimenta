class AddJoinedToConversationParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :conversation_participants, :joined, :boolean, default: false
  end
end
