require_relative 'person'
require_relative 'student'
require_relative 'student_short'
require_relative 'binary_tree'


# student = Student.new(
	# first_name: "Иван",
	# name: "Иванов",
	# patronymic: "Иванович",
	# id: 1,
	# telegram: "@ivanov",
	# phone_number: "+71234567890",
	# email: "ivanov@example.com",
	# git: "github.com/ivanov",
	# birth_date: date '2000-07-13'
# )
# puts student.to_s
# puts student.get_info
# puts student.get_any_contact


# student.set_contacts(phone_number: "+71234567899", telegram: "@example", email: "email@example.com")

# puts student.to_s

# sh = Student_short.from_string(id: 2, string: "Ива8ов 4.И., telegram: @рарnov, github.com/ivanov")

# puts sh.id
# puts sh.full_name
# puts sh.git
# puts sh.contact

students = [
  Student.new(id: 1, first_name: 'Иванов', name: 'Иван', patronymic: 'Иванович', birth_date: '2015-12-21'),
  Student.new(id: 2, first_name: 'Петров', name: 'Петр', patronymic: 'Петрович', birth_date: '1999-01-10'),
  Student.new(id: 3, first_name: 'Сидоров', name: 'Сидор', patronymic: 'Сидорович', birth_date: '2000-07-13')
]

tree = Binary_tree.new
students.each { |student| tree.add(student) }

puts "Студенты в порядке возрастания даты рождения:"
tree.each { |student| puts student }


