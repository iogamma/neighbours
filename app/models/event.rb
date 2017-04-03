class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image

  belongs_to :user
  belongs_to :neighbourhood

  has_many :event_comments, dependent: :delete_all
  has_many :attendees, dependent: :delete_all
  def crop_image
    image.recreate_versions! if crop_x.present?
  end

  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true,
            length: { minimum: 10 }
  validates :image, presence: true
  validates :date, presence: true

end
