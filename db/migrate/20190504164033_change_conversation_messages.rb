class ChangeConversationMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_messages do |t|
      t.references :conversation, foreign_key: true
      t.integer :sender_id
      t.string :sender_type
      t.timestamps
    end
  end
end
