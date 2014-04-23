class Applicant < ActiveRecord::Base
	
	has_many :jobs, through: :job_applications

 	has_attached_file :resume
  validates_attachment_content_type :resume, :content_type =>['application/pdf']
end
