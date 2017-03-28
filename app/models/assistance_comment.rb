class AssistanceComment < ApplicationRecord
  belongs_to :assistance
  belongs_to :user
end
