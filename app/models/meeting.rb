class Meeting < ApplicationRecord

  belongs_to :user
  belongs_to :neighbourhood

  has_many :documents, dependent: :delete_all
  has_many :videos, dependent: :delete_all

  validates :title, presence: true
  validates :date, presence: true
end
