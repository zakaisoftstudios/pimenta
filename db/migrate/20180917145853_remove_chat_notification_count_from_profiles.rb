class RemoveChatNotificationCountFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :student_profiles, :chat_notifications_count
    remove_column :company_profiles, :chat_notifications_count
  end
end
