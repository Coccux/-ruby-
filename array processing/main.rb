require_relative 'array_processor'

puts "Выберите номер задачи:"
puts "1 - Найти уникальный элемент"
puts "2 - Найти два наименьших элемента"
puts "3 - Найти элемент, ближайший к R"
puts "4 - Найти список положительных делителей"

choice = gets.to_i

puts "Введите имя файла с данными:"
filename = gets.chomp

data = File.readlines(filename).map(&:strip).reject(&:empty?).map(&:to_i)
array_processor = ArrayProcessor.new(array: data)

case choice
when 1
  result = array_processor.find { |element| array_processor.array.count(element) == 1 }
  puts "Уникальный элемент: #{result}"

when 2
  result = array_processor.array.uniq.min(2)  
  puts "Два наименьших элемента: #{result}"

when 3
  puts "Введите значение R:"
  r = gets.to_i
  result = array_processor.min_by { |element| (element - r).abs }
  puts "Элемент, ближайший к #{r}: #{result}"

when 4
  puts "Введите число для нахождения делителей:"
  number = gets.to_i
  result = ArrayProcessor.new(array: (1..number).to_a).filter_map { |i| i if number % i == 0 }
  puts "Положительные делители числа #{number}: #{result}"
end
