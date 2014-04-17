class Job_application < ActiveRecord::Base
	belongs_to :job
	belongs_to :applicant
end