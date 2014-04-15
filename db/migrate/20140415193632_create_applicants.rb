class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthdate
      t.string :address
      t.integer :age
      t.integer :company_id
      t.integer :job_id
    end
  end
end
