class CreatePollUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_users do |t|

      t.timestamps
    end
  end
end
