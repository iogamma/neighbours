class AdminChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "admin_chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    AdminChat.create! message: data["chat_input"], email: "hal@gmail.com", first_name: "Hal"
  end
end
