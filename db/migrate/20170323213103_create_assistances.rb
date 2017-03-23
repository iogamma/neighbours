class CreateAssistances < ActiveRecord::Migration[5.0]
  def change
    create_table :assistances do |t|

      t.timestamps
    end
  end
end
