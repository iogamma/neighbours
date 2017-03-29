class AdminChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_input)
    ActionCable.server.broadcast "admin_chat_channel", chat_message: render_message(chat_input)
  end

  def render_message(chat_input)
    ApplicationController.renderer.render(partial: "admin/dashboard/chat_message", locals: { chat_input: chat_input })
  end
end
