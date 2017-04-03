class Video < ApplicationRecord

  belongs_to :meeting

  # validates :youtube_url => {:message => "Please include full url." }

  private

  def youtube_url
    self.location.start_with?("https://youtu.be", "https://www.youtube.com/embed")
  end
end
