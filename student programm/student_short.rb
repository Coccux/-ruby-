require_relative 'person.rb'

class Student_short < Person
    attr_reader :id, :full_name
	attr_accessor :contact
    private_class_method :new

    def initialize(full_name:, git:, contact:, id: nil)
        self.id = id
        self.full_name = full_name
        self.git = git
        self.contact = contact
    end

    # constructor from Student object
    def self.new_from_student_obj(student)
        self.new(
            id: student.id.to_i,
            full_name: student.get_full_name.slice(11..-1),
            git: student.git,
            contact: student.get_any_contact
        )
    end

    def self.from_string(id:,string:)
		fullname, contact, git= read_info_from_string(string)
		new(id: id, fullname:fullname, contact:contact, git:git)
	end

	def  self.read_info_from_string(string)
		fullname,contact,git = string.split(', ')
		return fullname,contact,git
	end 

    def validate_contacts?
        !self.contact.nil?
    end

    def validate?
        super && self.validate_contacts?
    end

    private 
    attr_writer :id

    

    def get_any_contact
        @contact
    end

    def full_name=(full_name)
        unless self.class.valid_name?(full_name)
            raise ArgumentError, "Wrong name format"
        end
        @full_name = full_name
    end

    def self.valid_name?(name)
        name =~ /^[А-ЯЁ][а-яё]{1,}(-[А-ЯЁ][а-яё]{1,})?\s[А-ЯЁ].\s?[А-ЯЁ].$/
    end
end