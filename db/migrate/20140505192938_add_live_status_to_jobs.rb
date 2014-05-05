class AddLiveStatusToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :live_status, :boolean, default: true
  end
end
