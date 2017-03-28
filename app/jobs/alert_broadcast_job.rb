class AlertBroadcastJob < ApplicationJob
  queue_as :default

  def perform(alert)
    ActionCable.server.broadcast "alerts_channel", alert_message: render_alert(alert)
  end

  def render_alert(alert)
    ApplicationController.renderer.render(partial: "alerts/alert", locals: { alert: alert })
  end
end