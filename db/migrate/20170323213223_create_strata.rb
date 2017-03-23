class CreateStrata < ActiveRecord::Migration[5.0]
  def change
    create_table :strata do |t|

      t.timestamps
    end
  end
end
