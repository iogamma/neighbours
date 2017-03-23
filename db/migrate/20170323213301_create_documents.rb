class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.string :location, null: false

      t.timestamps null: false
    end
  end
end
