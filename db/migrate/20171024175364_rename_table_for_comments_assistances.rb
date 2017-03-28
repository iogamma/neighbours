class RenameTableForCommentsAssistances < ActiveRecord::Migration[5.0]
  def change
    rename_table :comments_assistances, :assistance_comments
  end
end
