class AddTimestampsToJobApplications < ActiveRecord::Migration
  def change
  	change_table :job_applications do |t|
  		t.timestamps
  	end
  end
end
