class CreateStrata < ActiveRecord::Migration[5.0]
  def change
    create_table :strata do |t|
      t.string :strata_title, null: false

      t.timestamps null: false
    end
  end
end

