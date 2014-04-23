class JobApplication < ActiveRecord::Base
	belongs_to :job
	belongs_to :applicant
end