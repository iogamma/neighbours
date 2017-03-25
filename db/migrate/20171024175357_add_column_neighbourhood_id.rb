class AddColumnNeighbourhoodId < ActiveRecord::Migration[5.0]
  def change
    add_column :assistances, :neighbourhood_id, :integer
    add_column :events, :neighbourhood_id, :integer
  end
end
