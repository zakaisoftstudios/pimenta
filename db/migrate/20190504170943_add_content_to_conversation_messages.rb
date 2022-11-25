class AddContentToConversationMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :conversation_messages, :content, :string
  end
end
