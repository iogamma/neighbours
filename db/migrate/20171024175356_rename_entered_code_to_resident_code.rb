class RenameEnteredCodeToResidentCode < ActiveRecord::Migration[5.0]
  def change
     rename_column :users, :entered_code, :resident_code
  end
end
