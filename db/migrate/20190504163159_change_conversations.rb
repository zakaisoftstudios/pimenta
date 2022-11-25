class ChangeConversations < ActiveRecord::Migration[5.0]
  def change
    drop_table :conversation_messages
    drop_table :conversation_participants
    drop_table :conversations

    create_table :conversations do |t|
      t.references :company_profile, foreign_key: true
      t.references :student_profile, foreign_key: true
      t.timestamps
    end
  end
end
