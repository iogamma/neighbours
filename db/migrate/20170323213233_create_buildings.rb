class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.text    :address, null: false
      t.string  :name, null: false

      t.integer :neighbourhood_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
