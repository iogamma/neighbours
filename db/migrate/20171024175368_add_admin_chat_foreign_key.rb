class AddAdminChatForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_chats, :neighbourhood_id, :integer, null: true, index: true
    add_foreign_key :admin_chats, :neighbourhoods
  end
end
