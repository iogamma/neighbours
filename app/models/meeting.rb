class Meeting < ApplicationRecord
  mount_uploader :video, MeetingVideoUploader
  mount_uploader :document, MeetingDocumentUploader
  belongs_to :user
  belongs_to :neighbourhood

  has_many :documents
  has_many :videos
end
