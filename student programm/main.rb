require_relative 'students'

stud=Student.new(
	surname: "Иванов",
	name:"Иван",
	patronymic: "Иванович",
	id: "1",
	number_phone: "8123f567890",
	telegram: "ssss",
	email: "dddd",
	git: "fff"
)

stud.print_info