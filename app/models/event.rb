class Event < ApplicationRecord
  belongs_to :user
  belongs_to :neighbourhood
  has_many :comments_events
end
