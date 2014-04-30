class JobApplication < ActiveRecord::Base
	belongs_to :job
	belongs_to :applicant

	# def self.status
	# 	["Application Received", "In Progress", "Application Closed"]
	# end
end