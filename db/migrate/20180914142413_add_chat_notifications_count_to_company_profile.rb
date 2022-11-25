class AddChatNotificationsCountToCompanyProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :company_profiles, :chat_notifications_count, :integer, default: 0
  end
end
