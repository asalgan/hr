class AddJobCodeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :job_code, :integer
  end
end
