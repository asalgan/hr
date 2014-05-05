class AddAttachmentCoverLetterToApplicants < ActiveRecord::Migration
  def change
  	change_table :applicants do |t|
      t.attachment :cover_letter
    end
  end
end
