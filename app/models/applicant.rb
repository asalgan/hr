class Applicant < ActiveRecord::Base
	include PgSearch

	has_many :jobs, through: :job_applications
	has_many :notes
	has_one :job_application

 	has_attached_file :resume
  validates_attachment_content_type :resume, :content_type =>['application/pdf']

  has_attached_file :cover_letter
  validates_attachment_content_type :cover_letter, :content_type =>['application/pdf']

  pg_search_scope :search_by_applicant_info, :against => [:current_job_role, :first_name, :last_name, :current_job_company, :current_job_city, :resume_parse]

  def full_name
  	"#{first_name} #{last_name}"
  end

end

