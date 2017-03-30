class AdminChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    ActionCable.server.broadcast "AdminChatChannel_#{chat.neighbourhood_id}", chat_message: render_message(chat)
  end

  def render_message(chat)
    ApplicationController.renderer.render(partial: "admin/dashboard/chat_message", locals: { chat: chat })
  end
end
