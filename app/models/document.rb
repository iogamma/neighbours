class Document < ApplicationRecord
  mount_uploader :location, DocumentUploader

  belongs_to :meeting

end
