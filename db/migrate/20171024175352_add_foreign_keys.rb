class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :buildings, :neighbourhoods
    add_foreign_key :units, :buildings
    add_foreign_key :users, :units

    add_foreign_key :meetings, :neighbourhoods
    add_foreign_key :meetings, :users
    add_foreign_key :documents, :meetings
    add_foreign_key :videos, :meetings

    add_foreign_key :notices, :neighbourhoods
    add_foreign_key :notices, :users

    add_foreign_key :polls, :neighbourhoods
    add_foreign_key :polls, :users
    add_foreign_key :polls_users, :polls
    add_foreign_key :polls_users, :users

    add_foreign_key :events, :users
    add_foreign_key :events_users, :users
    add_foreign_key :events_users, :events
    add_foreign_key :comments_events, :events
    add_foreign_key :comments_events, :users

    add_foreign_key :assistances, :users
    add_foreign_key :comments_assistances, :assistances
    add_foreign_key :comments_assistances, :users
  end
end
