class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date     :date
      t.integer  :score
      t.integer  :dofw
      t.integer  :week_num
      t.integer  :range_value
      t.string   :range_color
      t.text     :notes

      t.timestamps
    end

    add_reference :days, :goal, index: true
  end
end
