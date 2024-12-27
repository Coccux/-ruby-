require_relative 'base_student'
require_relative 'student'
require_relative 'student_short'

student1 = Student.new(
  id: '1',
  name: 'Pol', 
  lastname: 'Lock',
  middlename: 'Gvozd',
  git: 'github.com/Pol',
  email: 'Lock@yandex.ru',
  phone: '+79186654123',
  telegram: '@lock'
)

student2 = Student.new(
  id: '2',
  name: 'Bob',
  lastname: 'Bobert',
  middlename: 'Bobrovich',
  email: 'ef@bob.ru',
  git: 'github.com/bob',
  telegram: '@bobert'
)

student3 = Student.new(
  id: '3',
  name: 'Uileas',
  middlename: 'Knjkovich',
  lastname:'Phog',
  git: 'github.com/Uileas',
  telegram: '@Phog'
  )

student_from_student = StudentShort.from_student(student3)
student_short_info = "Primer O.O.; github.com/Primer; Primer@rivendel.com, +79991234567, @Primer"
student_short_from_info = StudentShort.from_string(id: 3, str: student_short_info)
student4 = StudentShort.from_student(student3)

puts student1.to_s
puts student2.to_s
student3.set_contacts(telegram: "@abvgd")
puts student1.to_s
student1.validate_git_and_contact


puts student3

puts student2.get_info.to_s

puts "\n Краткая инфа:\n #{student_short_from_info.to_s},\n #{student_from_student}  \n\n"



puts student1.short_name
puts student3.set_contacts