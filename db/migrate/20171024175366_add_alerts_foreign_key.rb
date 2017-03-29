class AddAlertsForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :neighbourhood_id, :integer, null: true, index: true
    add_foreign_key :alerts, :neighbourhoods
  end
end
