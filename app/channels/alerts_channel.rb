class AlertsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "alerts_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Alert.create! message: data["alert_message"], email: "hal@gmail.com", first_name: "Hal"
  end
end
