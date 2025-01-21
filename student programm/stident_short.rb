class Student_short
	attr_reader :id, :fullname, :git, :contact 
	
	private
	def initialize(id: nil, fullname: , git: nil, contact: nil)
		@id = id
		@fullname = fullname
		@git = git
		@contact = contact
	end 
	
	def self.info_student(student)
		new(id:student.id, fullname:student.full_name, git: student.get_git(), contact: student.get_contacts() )
	end 
  
	def self.info_id_and_string(id: string:)
		new(id: id, string: getinfo())
	end
end