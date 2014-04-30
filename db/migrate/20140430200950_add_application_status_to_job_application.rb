class AddApplicationStatusToJobApplication < ActiveRecord::Migration
  def change
  	add_column :job_applications, :application_status, :string, default: "Application Received"
  end
end
