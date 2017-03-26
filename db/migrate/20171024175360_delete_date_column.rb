class DeleteDateColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :assistances, :date
  end
end
