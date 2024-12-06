require_relative 'student'
# Создание объектов студентов
student1 = Student.new(last_name: 'Иванов', first_name: 'Иван', middle_name: 'Иванович', 

id: 1, phone: '+7 123 456-78-90', email: 'ivanov@mail.com', git: 'github.com/ivan',telegram: '@ivanov')

student2 = Student.new(last_name: 'Петров', first_name: 'Петр', middle_name: 'Петрович', 
git: 'github.com/petr', phone: '+7 123 456-78-90', email: 'ivanov@mail.com')

student3 = Student.new(last_name: 'Сидоров', first_name: 'Сидор', middle_name: 'Сидорович', 

git: 'github.com/sidorov', phone: '+7 123 456-78-90', id: 23, email: 'ivanov@mail.com')

# Вывод информации о студентах
puts student1
puts student2
puts student3