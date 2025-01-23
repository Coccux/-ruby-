require_relative 'person'
require_relative 'student'
require_relative 'student_short'

# Пример использования класса Student

student = Student.new(
	first_name: "Иван",
	name: "Иванов",
	patronymic: "Иванович",
	id: 1,
	telegram: "@ivanov",
	phone_number: "+71234567890",
	email: "ivanov@example.com",
	git: "github.com/ivanov"
)
puts student.to_s
puts student.get_info
puts student.get_any_contact
puts "Student valid? #{student.validate_contacts?}"

student.set_contacts(number_phone: "12345678901", telegram: nil, email: "email@example.com")

puts student.to_s

sh = Student_short.new_from_student_obj(student)
puts sh.id
puts sh.full_name
puts sh.git
puts sh.contact

