class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader

  belongs_to :user
  belongs_to :neighbourhood

  has_many :attendees
  has_many :event_comments
end
