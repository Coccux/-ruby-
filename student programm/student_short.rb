require_relative 'person.rb'

class Student_short < Person

    def initialize(full_name:, git:, contact:, id:)
        super(id: id)
        self.full_name = full_name
        self.git = git
        self.contact = contact
    end

    def self.new_from_student_obj(student)
        self.new(
            id: student.id.to_i,
            full_name: student.get_full_name.slice(11..-1),
            git: student.git,
            contact: student.get_any_contact
        )
    end

    def self.from_string(id:,string:)
		full_name, contact, git= read_info_from_string(string)
		new(id: id, full_name:full_name, contact:contact, git:git)
	end

	def  self.read_info_from_string(string)
		full_name,contact,git = string.split(', ')
		return full_name,contact,git
	end 
    
	private_class_method :new

	def to_s
		details = []
		details << "ID: #{@id}" if @id
		details << "full name: #{@full_name}"
		details << "GitHub: #{@git}" if @git
		details << "Contacts: #{@contact}" if @contact
		details.join("\n")
	end
end