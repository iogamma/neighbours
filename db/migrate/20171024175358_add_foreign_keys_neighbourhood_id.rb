class AddForeignKeysNeighbourhoodId < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :events, :neighbourhoods
    add_foreign_key :assistances, :neighbourhoods
  end
end
