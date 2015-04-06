class AddFeildsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name,         :string
    add_column :users, :telephone,    :string
    add_column :users, :internal_bio, :text
    add_column :users, :role,         :integer, default: 0
    add_column :users, :credits,      :integer, default: 0

    add_index  :users, :role
  end
end