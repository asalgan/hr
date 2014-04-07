class AddDepartmentToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :department, :string
  end
end
