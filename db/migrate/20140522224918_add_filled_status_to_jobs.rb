class AddFilledStatusToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :filled_status, :boolean, default: false
  end
end
