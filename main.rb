require_relative 'student'
# Создание объектов студентов
student1 = Student.new(last_name: 'Иванов', first_name: 'Иван', middle_name: 'Иванович', id: 1, phone: '+7123457890', email: 'ivanov@mail.com', git: 'github.com/ivan')
student2 = Student.new(last_name: 'Петров', first_name: 'Петр', middle_name: 'Петрович', git: 'github.com/petr', phone: '+7123457890')
student3 = Student.new(last_name: 'Сидоров', first_name: 'Сидор', middle_name: 'Сидорович', git: 'github.com/sidorov', phone: '+7123457890', id: 23)

# Вывод информации о студентах
puts student1
puts student2
puts student3