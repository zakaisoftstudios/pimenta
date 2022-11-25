class AddReadToConversationMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :conversation_messages, :read, :boolean, default: false
  end
end
