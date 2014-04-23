class RemoveResumeFileNameFromApplicants < ActiveRecord::Migration
  def change
  	remove_column :applicants, :Resume_file_name
  	remove_column :applicants, :Resume_content_type
  	remove_column :applicants, :Resume_file_size
  	remove_column :applicants, :Resume_updated_at
  end
end
