class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader

  belongs_to :user
  belongs_to :neighbourhood

  has_many :attendees, dependent: :destroy
  has_many :event_comments, dependent: :destroy
end
