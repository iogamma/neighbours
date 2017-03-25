class Event < ApplicationRecord
  belongs_to :user

  has_many :comments_events
end
