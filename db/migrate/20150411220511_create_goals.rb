class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.string :category
      t.string :theme

      t.timestamps
    end

    add_reference :goals, :user, index: true
  end
end
