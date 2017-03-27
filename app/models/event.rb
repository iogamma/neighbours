class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader

  belongs_to :user
  belongs_to :neighbourhood
  has_many :comments_events
end
