class CreateTimers < ActiveRecord::Migration

  def change
    create_table :timers do |t|
      t.integer  :task_id
      t.integer  :proofreader_id
      t.datetime :start_time
      t.datetime :end_time
    end
    add_index :timers, :task_id
    add_index :timers, :proofreader_id
  end

end
