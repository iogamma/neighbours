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

  def array_helper (array, key)
    new_array = Array.new
    array.each do |a|
      new_array << a.key
    end
    new_array
  end

end
