class AddAdditionalQuestionsToJobApplications < ActiveRecord::Migration
  def change
  	add_column :job_applications, :additional_question1, :string
  	add_column :job_applications, :additional_question2, :string
  	add_column :job_applications, :additional_question3, :string
  end
end
