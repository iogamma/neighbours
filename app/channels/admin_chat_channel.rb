class AdminChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from  "AdminChatChannel_#{params[:room_num]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    AdminChat.create! message: data["chat_input"],
                      email: current_user.email,
                      first_name: current_user.first_name,
                      neighbourhood_id: params[:room_num]
  end
end
