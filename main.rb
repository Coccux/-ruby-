require_relative 'student'
# Создание из объектов Student 
student = Student.new(last_name: 'Иванов', first_name: 'Иван', middle_name: 'Иванович',
                      id: 1, phone: '+7 123 456-78-90', git: 'github.com/ivan')

student_short = StudentShort.new(student)
puts student_short.id                 
puts student_short.last_name_initials 
puts student_short.git                
puts student_short.contact     

# Создание из ID и строки
data = 'Иванов И.И., github.com/ivan, Телефон:+71234567890'
student_short = StudentShort.new(1, data)
puts student_short.id                 
puts student_short.last_name_initials 
puts student_short.git                
puts student_short.contact            
