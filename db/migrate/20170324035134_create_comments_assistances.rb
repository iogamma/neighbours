class CreateCommentsAssistances < ActiveRecord::Migration[5.0]
  def change
    create_table :comments_assistances do |t|
      t.text :content, null: false

      t.integer :assistance_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.timestamps null:false
    end
  end
end
