# Написать методы, которые находят минимальный, элементы,номер первого положительного элемента. Каждая операция в отдельном
# методе. Решить задачу с помощью циклов(for и while).

# Метод для нахождения минимального элемента с использованием цикла for
def find_min_element(arr)
  min = arr[0]
  for i in 1...arr.length
    min = arr[i] if arr[i] < min
  end
  min
end

# Метод для нахождения номера первого положительного элемента с использованием цикла while
def find_first_positive_index(arr)
  i = 0
  while i < arr.length
    return i if arr[i] > 0
    i += 1
  end
  nil  # Если положительного элемента нет, возвращаем nil
end

# Основная программа
if ARGV.length != 2
  puts "Использование: ruby script_name.rb <метод> <путь к файлу>"
  puts "Методы: min, first_pos"
  exit
end

# Получаем метод и путь к файлу
method_name = ARGV[0]
filename = ARGV[1]

# Метод для чтения массива чисел из файла
def read_array_from_file(filename)
  # Читаем содержимое файла и преобразуем его в массив чисел
  File.read(filename).split.map { |x| x.to_i }
end

# Считываем массив из файла
begin
  array = read_array_from_file(filename)
rescue => e
  puts "Ошибка при чтении файла: #{e.message}"
  exit
end

# В зависимости от переданного метода вызываем соответствующую функцию
case method_name
when "min"
  puts "Минимальный элемент : #{find_min_element(array)}"
when "first_pos"
  index = find_first_positive_index(array)
  puts index.nil? ? "Положительных элементов нет." : " Номер первого положительного элемента : #{index}"
else
  puts "Неправильный метод. Используйте min, first_pos."
end
