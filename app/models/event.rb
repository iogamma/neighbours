class Event < ApplicationRecord
  mount_uploader :image, EventImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image

  belongs_to :user
  belongs_to :neighbourhood

  def crop_image
    image.recreate_versions! if crop_x.present?
  end

end
