class Job_application < ActiveRecord::Base
	belongs_to :job, :dependent => :destroy
	belongs_to :applicant
end