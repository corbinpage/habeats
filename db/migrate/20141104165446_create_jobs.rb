class CreateJobs < ActiveRecord::Migration
  
  def change
    create_table :jobs do |t|
      t.integer  :user_id
      t.string   :job_type
      t.boolean  :complete
      t.datetime :completed_at

      t.timestamps
    end
    add_index :jobs, :user_id
    add_index :jobs, :job_type
  end

end