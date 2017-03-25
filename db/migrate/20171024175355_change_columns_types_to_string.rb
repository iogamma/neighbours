class ChangeColumnsTypesToString < ActiveRecord::Migration[5.0]
  def change
    change_column :polls_users, :vote, :string

    change_column :events_users, :attend, :string
  end
end
