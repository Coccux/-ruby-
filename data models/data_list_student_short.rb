require_relative 'data_list.rb'
class DataListStudentShort < DataList
	def base_names
        ["name", "git", "contacts"]
    end
	
	def build_row(student_short, index)
        [
            index + 1,                  
            student_short.initials,      
            student_short.git,           
            student_short.contacts       
        ]
end