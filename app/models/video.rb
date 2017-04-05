class Video < ApplicationRecord

  belongs_to :meeting

  validates :location, presence: true, format: {with: /(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+/, message: "url: please include full URL"}

end
