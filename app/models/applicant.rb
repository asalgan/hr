class Applicant < ActiveRecord::Base
  include PgSearch

  has_many :jobs, through: :job_applications
  has_many :notes
  has_one :job_application

  has_attached_file :resume

  CONTENT_TYPE = ['application/txt', 'text/plain',
    'application/pdf', 'application/msword',
    'application/doc', 'application/docx', 'application/x-soffice']
    

  validates_attachment :resume, 
    content_type: {content_type: CONTENT_TYPE}

  has_attached_file :cover_letter

  validates_attachment :cover_letter, 
    content_type: {content_type: CONTENT_TYPE}

  pg_search_scope :search_by_applicant_info, :against => [:current_job_role, :first_name, :last_name, :current_job_company, :current_job_city, :resume_parse]

  def full_name
  	"#{first_name} #{last_name}"
  end

  def resume_present_and_pdf?
    self.resume.present? && self.resume_content_type == "application/pdf"
  end

  def resume_present_and_doc?
    self.resume.present? && ["application/doc", 'application/docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/x-soffice', 'application/msword', 'application/vnd.oasis.opendocument.text'].include?(self.resume_content_type)
  end

  def cover_letter_present_and_pdf?
    self.resume.present? && self.cover_letter_content_type == "application/pdf"
  end

  def cover_letter_present_and_doc?
    self.resume.present? && ["application/doc", 'application/docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/x-soffice', 'application/msword', 'application/vnd.oasis.opendocument.text'].include?(self.cover_letter_content_type)
  end
end

