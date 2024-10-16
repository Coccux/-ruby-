require_relative 'student'
# Создание объектов студентов
student1 = Student.new('Иванов', 'Иван', 'Иванович', 1, '123456789', '@ivanov', 'ivanov@mail.com', 'github.com/ivanov')
student2 = Student.new('Петров', 'Петр', 'Петрович')
student3 = Student.new('Сидоров', 'Сидор', 'Сидорович', 3, nil, '@sidorov', nil, 'github.com/sidorov')
# Вывод информации о студентах
puts student1
puts student2
puts student3