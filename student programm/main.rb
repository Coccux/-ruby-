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
# puts student.to_s
# puts student.get_info
# puts student.get_any_contact


# student.set_contacts(phone_number: "+71234567899", telegram: "@example", email: "email@example.com")

# puts student.to_s

sh = Student_short.from_string(id: 2, string: "Ива8ов 4.И., telegram: @рарnov, github.com/ivanov")

puts sh.id
puts sh.full_name
puts sh.git
puts sh.contact

