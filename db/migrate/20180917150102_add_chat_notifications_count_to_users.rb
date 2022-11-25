class AddChatNotificationsCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :chat_notifications_count, :integer, default: 0
  end
end
