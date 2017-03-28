class RenameTableForPollsUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :polls_users, :votes
  end
end
