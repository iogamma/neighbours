class Video < ApplicationRecord

  belongs_to :meeting

  validates :location, presence: true, format: {with: /(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+/, message: "url: please include full URL"}


  # def youtube_url(self)
  #   self.location.start_with?("https://youtu.be", "https://www.youtube.com/embed")
  # end
end
