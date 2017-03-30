class DeleteAdminChatForeignKey < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :admin_chats, :neighbourhoods
    remove_column :admin_chats, :neighbourhood_id
  end
end
