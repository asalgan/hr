class AddAdditionalQuestionToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :additional_question, :string
  end
end
