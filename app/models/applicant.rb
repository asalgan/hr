class Applicant < ActiveRecord::Base
	include PgSearch

	has_many :jobs, through: :job_applications
	has_many :notes
	has_one :job_application

 	has_attached_file :resume
  validates_attachment_content_type :resume, :content_type =>['application/txt', 'text/plain',
    'application/pdf', 'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/vnd.oasis.opendocument.text',
    'application/x-vnd.oasis.opendocument.text',
    'application/doc', 'application/docx', 'application/x-soffice']

  has_attached_file :cover_letter

  validates_attachment_content_type :cover_letter, :content_type =>['application/txt', 'text/plain',
    'application/pdf', 'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/vnd.oasis.opendocument.text',
    'application/x-vnd.oasis.opendocument.text',
    'application/doc', 'application/docx', 'application/x-soffice']

  pg_search_scope :search_by_applicant_info, :against => [:current_job_role, :first_name, :last_name, :current_job_company, :current_job_city, :resume_parse]

  def full_name
  	"#{first_name} #{last_name}"
  end

  def resume_present_and_pdf?
    self.resume.present? && self.resume_content_type == "application/pdf"
  end

  def resume_present_and_doc?
    self.resume.present? && self.resume_content_type == "application/doc" || 'application/docx' ||'application/vnd.openxmlformats-officedocument.wordprocessingml.document' || 'application/x-soffice' || 'application/msword' || 'application/vnd.oasis.opendocument.text'
  end

  def cover_letter_present_and_pdf?
    self.resume.present? && self.resume_content_type == "application/pdf"
  end

  def cover_letter_present_and_doc?
    self.resume.present? && self.resume_content_type == "application/doc" || 'application/docx' ||'application/vnd.openxmlformats-officedocument.wordprocessingml.document' || 'application/x-soffice' || 'application/msword' || 'application/vnd.oasis.opendocument.text'
  end
end

