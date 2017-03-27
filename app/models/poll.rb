class Poll < ApplicationRecord
  belongs_to :neighbourhood
  belongs_to :user
  has_many :votes
end
