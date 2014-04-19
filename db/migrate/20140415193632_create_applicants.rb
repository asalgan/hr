class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthdate
      t.string :address
      t.integer :age
      t.string :current_job_company
      t.string :current_job_role
      t.string :current_job_city
    end
  end
end
