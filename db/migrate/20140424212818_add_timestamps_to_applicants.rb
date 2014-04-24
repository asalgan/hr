class AddTimestampsToApplicants < ActiveRecord::Migration
  def change
  	change_table :applicants do |t|
  		t.timestamps
  	end
  end
end
