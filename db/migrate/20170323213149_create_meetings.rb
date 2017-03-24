class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.date    :date, null: false
      t.string  :location, null: false
      t.string  :title, null: false

      t.integer :neighbourhood_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
