class Applicant < ActiveRecord::Base
	has_many :jobs, through: :job_applications
end
