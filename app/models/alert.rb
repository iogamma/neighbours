class Alert < ApplicationRecord
  after_create_commit { AlertBroadcastJob.perform_later self }
end
