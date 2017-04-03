class Unit < ApplicationRecord
  belongs_to :building
  has_many :users

  def self.generate_code(size)
    alphanumeric_set = Array('A'..'Z') + Array(0..9)
    Array.new(size) { alphanumeric_set.sample }.join
  end

end