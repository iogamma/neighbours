class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.date   :date, null: false
      t.text   :description, null: false
      t.string :location, null: false
      t.string :title, null: false

      t.integer :user_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
