require 'pg'
require_relative '../student/student.rb'
require_relative '../student_short/student_short.rb'
require_relative '../data_list/data_list_student_short.rb'
require_relative './students_list_interface.rb'
require '../database/db_connection.rb'

class Students_list_db < Students_list_interface
    def initialize(db_config)
        self.connection = DB_connection.instance(db_config)
    end

    def get_student_by_id(id)
        result = connection.query("SELECT * FROM student WHERE id = $1", [id])
        if result.ntuples == 0
            raise "Студент с ID #{id} не найден"
        end

        student_data = result[0]
        Student.new(
            surname: student_data['surname'],
            firstname: student_data['firstname'],
            lastname: student_data['lastname'],
            id: student_data['id'].to_i,
            git: student_data['git'],
            email: student_data['email'],
            telegram: student_data['telegram'],
            phone_number: student_data['phone_number'],
            date_of_birth: student_data['date_of_birth']
        )
    end

    def get_k_n_student_short_list(k, n, data_list = nil)
        raise ArgumentError, 'k и n должны быть положительными числами' unless k > 0 && n > 0

         start = (k - 1) * n
        result = connection.query("SELECT * FROM student LIMIT $1 OFFSET $2", [n,  start])

        student_short_list = result.map do |student_data|
            student = Student.new(
                surname: student_data['surname'],
                firstname: student_data['firstname'],
                lastname: student_data['lastname'],
                id: student_data['id'].to_i,
                git: student_data['git'],
                email: student_data['email'],
                telegram: student_data['telegram'],
                phone_number: student_data['phone_number'],
                date_of_birth: student_data['date_of_birth']
            )
            Student_short.new(student: student)
        end

        data_list ||= Data_list_student_short.new(student_short_list, start)
        data_list
    end

    def add_student(student)
        result = connection.query(
            "INSERT INTO student (surname, firstname, lastname, git, email, telegram, phone_number, date_of_birth) 
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id",
            [
                student.surname, student.firstname, student.lastname, student.git, student.email,
                student.telegram, student.phone_number, student.date_of_birth
            ]
        )
        student.id = result[0]['id'].to_i
    end

    def replace_student_by_id(id, new_student)
        result = connection.query(
            "UPDATE student SET surname = $1, firstname = $2, lastname = $3, git = $4, email = $5, 
            telegram = $6, phone_number = $7, date_of_birth = $8 WHERE id = $9",
            [
                new_student.surname, new_student.firstname, new_student.lastname, new_student.git, 
                new_student.email, new_student.telegram, new_student.phone_number, new_student.date_of_birth, id
            ]
        )
        raise "Студент с ID #{id} не найден" if result.cmd_tuples == 0
    end

    def delete_student_by_id(id)
        result = connection.query("DELETE FROM student WHERE id = $1", [id])
        raise "Студент с ID #{id} не найден" if result.cmd_tuples == 0
    end

    def get_student_short_count
        result = connection.query("SELECT COUNT(*) FROM student")
        result[0]['count'].to_i
    end

    def close
        connection.close
    end

    private

    attr_accessor :connection
end