class CreateAssistances < ActiveRecord::Migration[5.0]
  def change
    create_table :assistances do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.date :date, null: false

      t.timestamps null: false
    end
  end
end
