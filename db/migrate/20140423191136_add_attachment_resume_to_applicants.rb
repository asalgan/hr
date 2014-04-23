class AddAttachmentResumeToApplicants < ActiveRecord::Migration
  def self.up
    change_table :applicants do |t|
      t.attachment :resume
    end
  end

  def self.down
    drop_attached_file :applicants, :resume
  end
end
