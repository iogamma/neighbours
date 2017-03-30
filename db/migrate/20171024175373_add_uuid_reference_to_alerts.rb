class AddUuidReferenceToAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :alerts, :room_id, :string, null: false
  end
end
