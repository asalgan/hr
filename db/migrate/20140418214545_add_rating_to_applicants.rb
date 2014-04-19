class AddRatingToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :rating, :integer, default: 0
  end
end
