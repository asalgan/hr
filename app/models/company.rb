class Company < ActiveRecord::Base
	belongs_to :user
	has_many :jobs, dependent: :destroy
	has_many :applicants, through: :job_applications
	has_many :job_applications

end
