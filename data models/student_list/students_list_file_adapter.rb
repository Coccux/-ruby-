require_relative './students_list_interface.rb'
require_relative './students_list_file.rb'
class Students_list_file_adapter < Students_list_interface
    def initialize(students_list_file)
        self.adaptee = students_list_file
    end
    
    def get_student_by_id(id)
        self.adaptee.get_student_by_id(id)
    end
    def get_k_n_student_short_list(k, n, data_list = nil)
        self.adaptee.get_k_n_student_short_list(k, n, data_list)
    end
    def add_student(student)
        self.adaptee.add_student(student)
    end
    def replace_student_by_id(id, new_student)
        self.adaptee.replace_student_by_id(id, new_student)
    end
    def delete_student_by_id(id)
        self.adaptee.delete_student_by_id(id)
    end
    
    def get_student_short_count
        self.adaptee.get_student_short_count
    end
    private
    attr_accessor :adaptee
end