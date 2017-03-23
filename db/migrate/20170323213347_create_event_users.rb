class CreateEventUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :event_users do |t|
      t.integer :intention, null: false

      t.timestamps null: false
    end
  end
end
