class CreatePollsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :polls_users do |t|
      t.integer :vote, null: false

      t.integer :poll_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
