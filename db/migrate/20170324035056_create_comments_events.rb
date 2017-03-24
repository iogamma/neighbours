class CreateCommentsEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :comments_events do |t|
      t.text :content, null: false

      t.integer :event_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
