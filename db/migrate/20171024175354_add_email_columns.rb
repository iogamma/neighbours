class AddEmailColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :notices, :email, :string

    add_column :polls, :email, :string

    add_column :meetings, :email, :string
  end
end
