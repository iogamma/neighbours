class RenameTableForEventsUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :events_users, :attendees
  end
end
