class CreatePollUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_users do |t|
      t.integer :vote, null: false

      t.timestamps null: false
    end
  end
end
