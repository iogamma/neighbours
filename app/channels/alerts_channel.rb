class AlertsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "alerts_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Alert.create! message: data["alert_input"],
                  email: current_user.email,
                  first_name: current_user.first_name,
                  room_id: params[:room_id]
  end

  def clear(data)
    Alert.destroy_all
    ActionCable.server.broadcast "alerts_channel_#{ data['room_id'] }", { payload_action: "CLEAR" }
  end

end
