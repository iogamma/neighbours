class Building < ApplicationRecord
  belongs_to :neighbourhood
  has_many :units
end
