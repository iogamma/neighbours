class Poll < ApplicationRecord
  belongs_to :neighbourhood
  belongs_to :user
end
