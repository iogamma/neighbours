class Document < ApplicationRecord
  mount_uploader :location, MeetingDocumentUploader

  belongs_to :meeting  
end
