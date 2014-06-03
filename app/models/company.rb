class Company < ActiveRecord::Base
	belongs_to :user
	has_many :jobs
	has_many :applicants, through: :job_applications
	has_many :job_applications
	has_many :prospects

	has_attached_file :logo	
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

end
