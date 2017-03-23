class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :resident_code, null: false
      t.string :unit_number

      t.timestamps null: false
    end
  end
end
