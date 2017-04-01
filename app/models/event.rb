class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image

  belongs_to :user
  belongs_to :neighbourhood

<<<<<<< HEAD
  has_many :event_comments, dependent: :delete_all
  has_many :attendees, dependent: :delete_all
=======
  def crop_image
    image.recreate_versions! if crop_x.present?
  end
>>>>>>> 51c73a0fdf480b98e8bd2f1158af758d640a29b7

end
