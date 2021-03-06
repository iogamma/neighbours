class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :notices do |t|
      t.date :date, null: false
      t.text :description, null: false
      t.string :title, null: false

      t.integer :neighbourhood_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
