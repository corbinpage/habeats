class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :name
      t.string :slug
      t.string :category

      t.timestamps
    end
  end
end
