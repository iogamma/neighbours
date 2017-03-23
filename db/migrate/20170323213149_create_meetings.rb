class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|

      t.timestamps null: false
    end
  end
end
