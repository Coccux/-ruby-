require_relative 'methods'

puts "Выберите номер задачи:"
puts "1 - Найти уникальный элемент"
puts "2 - Найти два наименьших элемента"
puts "3 - Найти элемент, ближайший к R"
puts "4 - Найти список положительных делителей"
puts "5 - Найти квадраты частовстречающихся чисел"

choice = gets.to_i

puts "Введите имя файла с данными:"
filename = gets.chomp

data = read_data_from_file(filename)

case choice

when 1
	arr = data.map(&:to_i)
	result = find_unique_element(arr) do |array|
		array.find do |element|
			array.count(element) == 1
		end
	end
	puts "Уникальный элемент: #{result}"

end
