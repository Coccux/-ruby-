require "./models/student/student.rb"
require "./models/student_short/student_short.rb"
require "./models/binary_tree/student_binary_tree.rb"
require "./models/students_list/students_list.rb"
require "./models/students_list_strategy/students_list_strategy_json.rb"
require "./models/students_list_strategy/students_list_strategy_yaml.rb"
require "./models/students_list/students_list_file.rb"
require "date"

require "./models/data_list/data_list_student_short.rb"

ivan = Student.new(surname:"Иванов", firstname:"Иван", lastname:"Иванович", id: 1, phone_number: "88005553535", git: "https://github.com/ivan", date_of_birth: Date.parse("16.06.2004"))
nikita = Student.new(
  surname: "Иванов",
  firstname: "Никита",
  lastname: "Александрович",
  id: 2,
  phone_number: "89183334455",
  telegram: "@AlexIvanov",
  git: "alexivanov",
  date_of_birth: Date.parse("12.07.2003")
)

masha = Student.new(
  surname: "Петрова",
  firstname: "Маша",
  lastname: "Ивановна",
  id: 3,
  phone_number: "89288887766",
  telegram: "t.me/AnnaP",
  date_of_birth: Date.parse("20.04.2004")
)

sergey = Student.new(
  surname: "Сидоров",
  firstname: "Сергей",
  lastname: "Петрович",
  phone_number: "89184497017"
)
sereja = Student_short.new(student: sergey)
maxim = Student_short.new(id: 10, contacts: "Сидоров М.С.; Git: https://github.com/sidor; Связь: [phone_number] +79182253564")
oleg = Student_short.new(id: 20, contacts: "Бульба О.О.;;")

# puts ivan
# puts nikita
# puts masha
# puts sergey

# puts "\nget_info для ivan: #{ivan.get_info}"

# puts "\nStudent_short 1:"
# puts sereja.initials
# puts sereja.contacts

# puts "\nStudent_short 2:"
# puts maxim.initials
# puts maxim.git
# puts maxim.contacts

# puts "\nStudent_short 3:"
# puts oleg.initials

# puts "\nvalidate для ivan: #{ivan.validate}"
# puts "\nvalidate для sereja: #{sereja.validate}"

# student_bt = Student_binary_tree.new
# student_bt.insert(ivan)
# student_bt.insert(nikita)
# student_bt.insert(masha)
# student_bt.insert(sergey)

# puts "\nУзлы двоичного дерева ivan, nikita, masha, sergey:"
# student_bt.each{|node| puts node.element}

puts("\nПроверка Data_list_student_short:")
student_short_list = Data_list_student_short.new([sereja, maxim , oleg])
table = student_short_list.get_data

(0..table.row_count - 1).each do |index|
    puts "#{table.get_element(index, 0)}, #{table.get_element(index, 1)}, #{table.get_element(index, 2)}, #{table.get_element(index, 3)}"   
end

json_strategy = Students_list_strategy_JSON.new
json_adapter = Students_list_file.new('./students.json', json_strategy)
students_list = Students_list.new(json_adapter)

puts "\nОтсортированные студенты в students_list (вторая страница, 2 на одной странице):"
data_list = students_list.get_k_n_student_short_list(2, 2)
data = data_list.get_data

(0..data.row_count - 1).each do |index|
    puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
end

test_student = Student.new(surname:"Сидоров", firstname:"Сидор", lastname:"Сидорович", phone_number: "89182297016")

puts "\nДобавление нового студента:"
students_list.add_student(test_student)
json_adapter.sort_by_initials

data_list = students_list.get_k_n_student_short_list(1, students_list.get_student_short_count)
data = data_list.get_data

(0..data.row_count - 1).each do |index|
    puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
end

puts "\nУдаление студента по id 4:"
students_list.delete_student_by_id(4)
data_list = students_list.get_k_n_student_short_list(1, students_list.get_student_short_count)
data = data_list.get_data

(0..data.row_count - 1).each do |index|
    puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
end

puts "\nЗамена студента с id 3:"
students_list.replace_student_by_id(3, test_student)
data_list = students_list.get_k_n_student_short_list(1, students_list.get_student_short_count)
data = data_list.get_data

(0..data.row_count - 1).each do |index|
    puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
end

puts "\nПроверка Students_list_YAML"
yaml_strategy = Students_list_strategy_YAML.new
yaml_adapter = Students_list_file.new('./students.yaml', yaml_strategy)
students_list_yaml = Students_list.new(yaml_adapter)
students_list_yaml.add_student(ivan)
students_list_yaml.add_student(nikita)
students_list_yaml.add_student(masha)

data_list = students_list_yaml.get_k_n_student_short_list(1, students_list.get_student_short_count)
data = data_list.get_data

(0..data.row_count - 1).each do |index|
    puts "#{data.get_element(index, 0)}, #{data.get_element(index, 1)}, #{data.get_element(index, 2)}, #{data.get_element(index, 3)}"   
end