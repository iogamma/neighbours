class RemoveForeignKeys < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :notices, :users
    
    remove_foreign_key :polls, :users

    remove_foreign_key :meetings, :users
  end
end
