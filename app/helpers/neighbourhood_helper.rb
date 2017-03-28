module NeighbourhoodHelper

  def feed_link (table, feed)
    case table
      when 'notices'
        neighbourhood_notice_path(feed.neighbourhood_id, feed)
      when 'assistances'
        neighbourhood_assistance_path(feed.neighbourhood_id, feed)
      else
        neighbourhood_path
    end
  end

  def select_notification (table)
    case table
      when 'notices'
        content_tag(:span, "#{table.titleize.singularize}", class: 'label label-default')
      when 'assistances'
        content_tag(:span, "#{table.titleize.singularize}", class: 'label label-primary')
    end
  end

  def find_user (user_id)
    User.find user_id
  end

end
