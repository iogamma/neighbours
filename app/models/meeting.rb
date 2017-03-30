class Meeting < ApplicationRecord

  belongs_to :user
  belongs_to :neighbourhood

  has_many :documents, dependent: :destroy
  has_many :videos, dependent: :destroy
end
