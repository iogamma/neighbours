class AlertDeleteJob < ApplicationJob
  queue_as :default

  def perform()
    ActionCable.server.broadcast "alerts_channel_#{alert.room_id}", { payload_action: "CLEAR" }
  end

end
