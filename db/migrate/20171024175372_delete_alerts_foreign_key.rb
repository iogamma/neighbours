class DeleteAlertsForeignKey < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :alerts, :neighbourhoods
    remove_column :alerts, :neighbourhood_id
  end
end

