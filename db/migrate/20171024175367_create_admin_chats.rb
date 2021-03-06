class CreateAdminChats < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_chats do |t|

      t.string :email, null: false
      t.string :first_name, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
