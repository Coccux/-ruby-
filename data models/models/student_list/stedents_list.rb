require_relative './students_list_file_adapter.rb'
#require_relative './students_list_db_adapter.rb'
class Students_list
    def initialize(adapter)
        self.adapter = adapter
    end

    def get_student_by_id(id)
        self.adapter.get_student_by_id(id)
    end
  
    def get_k_n_student_short_list(k, n, data_list = nil)
        self.adapter.get_k_n_student_short_list(k, n, data_list)
    end
  
    def add_student(student)
        self.adapter.add_student(student)
    end
  
    def replace_student_by_id(id, new_student)
        self.adapter.replace_student_by_id(id, new_student)
    end
  
    def delete_student_by_id(id)
        self.adapter.delete_student_by_id(id)
    end
  
    def get_student_short_count
        self.adapter.get_student_short_count
    end

    private
    
    attr_accessor :adapter
  end