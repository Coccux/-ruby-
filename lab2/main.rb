require_relative 'student'
require_relative 'student_short'

begin
student1 = Student.from_hash(
    id: 1,
    last_name_initials: 'Иванов И.И.',
    git: 'github.com/ivanov',
    contact: '+71234567890'
  )
  puts student1.get_info

  student2 = Student.from_string(
    "ID: 2, Имя: Петров П.П., Git: github.com/petrov, Контакт: @petrov"
  )
  puts student2.get_info
rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end