class CreateEventsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :events_users do |t|
      t.integer :attend, null: false

      t.integer :event_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
