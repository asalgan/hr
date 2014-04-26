class AddResumeParseToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :resume_parse, :text
  end
end
