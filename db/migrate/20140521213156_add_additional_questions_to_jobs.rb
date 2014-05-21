class AddAdditionalQuestionsToJobs < ActiveRecord::Migration
  def change
  	add_column :jobs, :additional_question1, :string
  	add_column :jobs, :additional_question2, :string
  	add_column :jobs, :additional_question3, :string
  end
end
