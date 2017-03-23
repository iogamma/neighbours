class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string :name, null: false
      t.text :address, null: false

      t.timestamps null: false
    end
  end
end
