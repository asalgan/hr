class Applicant < ActiveRecord::Base
	has_many :jobs, through: :job_applications

	has_attached_file :resume, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :resume, :content_type => /\Aimage\/.*\Z/
end
