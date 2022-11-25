class ChatNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
    p "#{current_user.profile.name} connected to ChatNotificationsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
