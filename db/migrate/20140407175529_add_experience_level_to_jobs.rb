class AddExperienceLevelToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :experience_level, :string
  end
end
