class AddInternalJobsFields < ActiveRecord::Migration
  def change
    add_column :jobs, :total_time, :float
  end
end
