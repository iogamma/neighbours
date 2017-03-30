class AddUuidReferenceToAdminChat < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_chats, :room_id, :string, null: false
  end
end
