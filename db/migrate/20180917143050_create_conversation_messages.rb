class CreateConversationMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_messages do |t|
      t.text :content, null: false
      t.references :conversation_participant, foreign_key: true

      t.timestamps
    end
  end
end
