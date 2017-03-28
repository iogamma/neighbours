class RenameTableForCommentsEvents < ActiveRecord::Migration[5.0]
  def change
    rename_table :comments_events, :event_comments 
  end
end
