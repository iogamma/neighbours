class AdminChat < ApplicationRecord
  after_create_commit { AdminChatBroadcastJob.perform_later self }
end
