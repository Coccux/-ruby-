require 'json'
require 'yaml'
require_relative '../student/student.rb'
require_relative '../student_short/student_short.rb'
require_relative '../data_list/data_list_student_short.rb'
require_relative '../binary_tree/student_binary_tree.rb'
require_relative '../students_list_strategy/students_list_strategy_json.rb'
require_relative '../students_list_strategy/students_list_strategy_yaml.rb'

class Students_list_file
    def initialize(file_path, strategy)
        self.file_path = file_path
        self.students = []
        self.strategy = strategy
        create_empty_file_if_not_exists
        read
    end
    
    def read
        self.students = strategy.read(file_path)
    end    

    def write
        strategy.write(file_path, students)
    end  

    def get_student_by_id(id)
        student = students.find { |student| student.id == id }
        raise "Студент с ID #{id} не найден" if student.nil?
        student
    end

    def get_k_n_student_short_list(k, n, data_list = nil)
        raise ArgumentError, 'k и n должны быть неотрицательными числами' unless k.is_a?(Integer) && n.is_a?(Integer) && k > 0 && n > 0
        
        start = (k - 1) * n

        selected_students = students[start, n] || []

        student_short_list = selected_students.map { |student| Student_short.new(student: student) }

        data_list ||= Data_list_student_short.new(student_short_list, start)
		
		data_list.offset = start
		
        data_list.data = student_short_list
		
        data_list
    end

    def sort_by_initials
        students.sort_by! { |student| student.initials }
    end

    def add_student(student)
        begin
            check_unique_fields(email: student.email, telegram: student.telegram, phone_number: student.phone_number, git: student.git)
        rescue => e
            raise e
        end
        new_id = students.empty? ? 1 : students.max_by(&:id).id + 1 
        student.id = new_id
        self.students << student
        
    end

    def replace_student_by_id(id, new_student)
        student_index = students.index { |student| student.id == id }
        if student_index.nil?
            raise "Студент с ID #{id} не найден"
        end
        students[student_index] = new_student
        new_student.id = id
        
    end

    def delete_student_by_id(id)
        student_index = students.index { |student| student.id == id }
        if student_index.nil?
            raise "Студент с ID #{id} не найден"
        end
        students.delete_at(student_index)
        
    end

    def get_student_short_count
        students.size
    end

    private

    attr_accessor :file_path, :students, :strategy

    def create_empty_file_if_not_exists
        unless File.exist?(file_path)
            File.write(file_path, empty_content)
        end
    end

    def empty_content
        strategy.empty_content
    end  

    def check_unique_fields(email: nil, telegram: nil, phone_number: nil, git: nil, current_student: nil)
        if !email.nil? && (current_student.nil? || email != current_student.email) && !unique_email?(email)
            raise 'Повторяющийся email'
        end

        if !telegram.nil? && (current_student.nil? || telegram != current_student.telegram) && !unique_telegram?(telegram)
            raise 'Повторяющийся telegram'
        end

        if !phone_number.nil? && (current_student.nil? || phone_number != current_student.phone_number) && !unique_phone_number?(phone_number)
            raise 'Повторяющийся номер телефона'
        end

        if !git.nil? && (current_student.nil? || git != current_student.git) && !unique_git?(git)
            raise 'Повторяющийся git'
        end
    end

    def unique_email?(email)
        unique?(:email, email)
    end

    def unique_telegram?(telegram)
        unique?(:telegram, telegram)
    end

    def unique_phone_number?(phone_number)
        unique?(:phone_number, phone_number)
    end

    def unique_git?(git)
        unique?(:git, git)
    end

    def unique?(type, key)
        tree = Student_binary_tree.new
        self.students.each do |student|
            tree.insert(student)
        end

        tree.find{|student| student.element.send(type) == key}.nil?
    end
end