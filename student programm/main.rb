require_relative 'students'

stud=Student.new(
	id: "1",
	surname: "Иванов",
	name:"Иван",
	patronymic: "Иванович",
	number_phone: "81234567890",
	telegram: "ssss",
	email: "dddd",
	git: "fff"
)

stud.print_info