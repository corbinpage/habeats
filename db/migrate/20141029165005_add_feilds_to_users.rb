class AddFeildsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name,         :string
    add_column :users, :telephone,    :string

    add_index  :users, :role
  end
end