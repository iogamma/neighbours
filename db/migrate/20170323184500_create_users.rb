class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :email, null: false
      t.string  :entered_code, null: false
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.boolean :on_council, null: false
      t.string  :password_digest, null: false

      t.integer :unit_id, null: false
      t.timestamps null: false
    end

    add_index "users", ["unit_id"], name: "index_users_on_unit_id", using: :btree
  end
end
