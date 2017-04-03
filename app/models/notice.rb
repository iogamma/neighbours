class Notice < ApplicationRecord
  belongs_to :neighbourhood
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true

end
