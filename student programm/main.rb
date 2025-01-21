require_relative 'students'

stud=Student.new(
	surname: "Иванов",
	name:"Иван",
	patronymic: "Иванович",
	id: 1,
	number_phone: "81234567890",
	telegram: "@ssss",
	email: "dddd@dddd.com",
	git: "github.com/ivanov"
)

puts stud.print_info

stud.set_contacts(number_phone: "12345678901", telegram: nil, email: "email@example.com")

puts stud.print_info