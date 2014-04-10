class Job < ActiveRecord::Base
	belongs_to :company

	def self.employment_types
		["Full Time", "Part Time", "Temporary", "Contract", "Seasonal", "Internship", "Volunteer"]
	end

	def self.employment_types_for_select
		[["Full Time","Full Time"], ["Part Time","Part Time"], ["Temporary","Temporary"], ["Contract","Contract"], ["Seasonal","Seasonal"], ["Internship","Internship"], ["Volunteer","Volunteer"]]
	end

	def self.experience_level
		["Student (High School)", "Student (Undergrad)", "Student (Graduate)", "Entry Level", "Mid Level", "Experienced", "Manager/Supervisor", "Senior Manager/Supervisor", "Executive", "Senior"]
	end

	def self.experience_level_for_select
		[["Student (High School)","Student (High School)"], ["Student (Undergrad)","Student (Undergrad)"], ["Student (Graduate)","Student (Graduate)"], ["Entry Level","Entry Level"], ["Mid Level","Mid Level"], ["Experienced","Experienced"], ["Manager/Supervisor","Manager/Supervisor"], ["Senior Manager/Supervisor","Senior Manager/Supervisor"], ["Executive","Executive"], ["Senior","Senior"]]
	end

end
