class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :neighbourhood

  has_many :documents
  has_many :videos
end
