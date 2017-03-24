class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.text :description, null: false
      t.string :title, null: false

      t.integer :neighbourhood_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps
    end
  end
end
