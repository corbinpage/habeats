class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer  :job_id
      t.string   :task_type
      t.boolean  :complete
    end
    add_index :tasks, :job_id
    add_index :tasks, :task_type
  end
end