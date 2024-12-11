require_relative 'student'
require_relative 'student_short'

begin
student_short1 = Student.from_hash(
    id: 1,
    last_name_initials: 'Иванов И.И.',
    git: 'github.com/ivanov',
    contact: '+79876543210'
  )
  puts student_short1.get_info

  student_short2 = Student.from_string(
    "ID: 2, Имя: Петров П.П., Git: github.com/petrov, Контакт: @petrov"
  )
  puts student_short2.get_info
rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end