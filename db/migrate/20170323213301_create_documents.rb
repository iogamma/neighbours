class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string  :location, null: false
      t.string  :name, null: false

      t.integer :meeting_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
