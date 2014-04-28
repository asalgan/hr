class AddApplicantIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :applicant_id, :integer
  end
end
