class Notice < ApplicationRecord
  belongs_to :neighbourhood
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true,
            length: { minimum: 10 }
  validates :date, presence: true

end
