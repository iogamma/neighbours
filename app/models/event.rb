class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader

  belongs_to :user
  belongs_to :neighbourhood

  has_many :event_comments, dependent: :delete_all
  has_many :attendees, dependent: :delete_all

end
