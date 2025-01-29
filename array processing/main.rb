def read_data_from_file(filename)
	File.readlines(filename).map(&:strip).reject(&:empty?)
end

def find_unique_element(arr, &block)
	block.call(arr)
end

def find_two_smallest(arr, &block)
	block.call(arr)
end

def find_closest_to_r(arr, r, &block)
  block.call(arr, r)
end

def find_positive_divisors(number, &block)
  block.call(number)
end



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

when 2
	arr = data.map(&:to_i)
	result = find_two_smallest(arr) do |array|
		array.uniq.min(2)
	end
	puts "Два наименьших элемента: #{result}"
	
when 3
	puts "Введите значение R:"
	r = gets.to_i
	arr = data.map(&:to_i)
	result = find_closest_to_r(arr, r) do |array, r|
		array.min_by { |element| (element - r).abs }
	end
	puts "Элемент, ближайший к #{r}: #{result}"
	
when 4
	puts "Введите число для нахождения делителей:"
	number = gets.to_i
	result = find_positive_divisors(number) do |num|
		(1..num).select { |i| num % i == 0 }
	end
	puts "Положительные делители числа #{number}: #{result}"
end
