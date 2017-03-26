module NeighbourhoodHelper
  def feed_link (table, feed)
    case table
      when 'notices'
        @link = neighbourhood_notice_path(feed.neighbourhood_id, feed)
      when 'assistances'
        @link = neighbourhood_assistance_path(feed.neighbourhood_id, feed)
      else
        @link = neighbourhood_path
    end
  end
end
