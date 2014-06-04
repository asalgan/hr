class Company < ActiveRecord::Base
	belongs_to :user
	has_many :jobs
	has_many :applicants, through: :job_applications
	has_many :job_applications
	has_many :prospects

	has_attached_file :logo	
  validates_attachment :logo,
  	content_type: {content_type: ['image/jpeg', 'image/jpg', 'image/png']},
  	:size => { :in => 0..500.kilobytes },
  	:bucket => 'HRAPP'

end
