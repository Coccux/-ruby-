require_relative 'data_list.rb'
require_relative "../data_table/data_table.rb"
require_relative "../student_short/student_short.rb"
class DataListStudentShort < DataList
	private
	def base_names
        ["name", "git", "contacts"]
    end
	
	def build_row(student_short, index)
        [
            index + 1+ offset,,                  
            student_short.initials,      
            student_short.git,           
            student_short.contacts       
        ]
end