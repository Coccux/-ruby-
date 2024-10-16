# Задание 1: Необходимая команда
puts "Hello World"

# Задание 2: Приветствие и работа с любимым языком пользователя

# Проверяем наличие аргумента командной строки
if ARGV.empty?
  puts "Пожалуйста, запустите программу с указанием вашего имени, например: ruby getting_to_know.rb Vlad"
  exit
end

# Принимаем имя пользователя в качестве аргумента программы
username = ARGV[0]

# Приветствие с использованием форматирования строки
puts "Привет, #{username}! Рад тебя видеть."

# Спрашиваем о любимом языке программирования
puts "Какой у тебя любимый язык программирования?"
favorite_language = $stdin.gets.chomp.downcase

# Ответ в зависимости от выбора пользователя
if favorite_language == "ruby"
  puts "Ты подлиза, #{username}! Ruby - это великолепный язык."
else
  puts "#{username}, скоро тебе понравится Ruby!"
  
  # Комментарии о других языках
  case favorite_language
  when "python"
    puts "Python отличный выбор, но Ruby все равно лучше!"
  when "javascript"
    puts "JavaScript хорош для веб-разработки, но Ruby проще!"
  when "c++"
    puts "C++ мощный, но с Ruby меньше боли в коде!"
  else
    puts "Интересный выбор! Но не забывай, Ruby прекрасен!"
  end
end

# Задание 3: Выполнение команд на Ruby и в ОС

# Спрашиваем команду для выполнения в Ruby
puts "Введите команду на языке Ruby:"
ruby_command = $stdin.gets.chomp #сохраняем команду в виде переменной 

# Выполнение команды Ruby
puts "Результат выполнения команды на Ruby:"
eval(ruby_command)

# Спрашиваем команду для выполнения в ОС
puts "Введите команду для выполнения в операционной системе:"
os_command = $stdin.gets.chomp

# Выполнение команды ОС 
puts "Результат выполнения команды ОС:"
system(os_command)

# Задание 4:  Работа с числами

# Пример использования:
number = 36

# Метод 1: Найти количество делителей числа, не делящихся на 3
def count_divisors_not_divisible_by_3(number)
  divisors = (1..number).select { |div| number % div == 0 }  # Находим все делители числа
  divisors_not_divisible_by_3 = divisors.reject { |div| div % 3 == 0 }  # Убираем те, что делятся на 3
  divisors_not_divisible_by_3.count
end
# Метод 1
puts "Количество делителей числа #{number}, не делящихся на 3: #{count_divisors_not_divisible_by_3(number)}"


# Метод 2: Найти минимальную нечетную цифру числа
def find_min_odd_digit(number)
  digits = number.to_s.chars.map(&:to_i)  # Преобразуем число в массив его цифр
  odd_digits = digits.select(&:odd?)  # Отбираем только нечетные цифры
  odd_digits.min  # Возвращаем минимальную нечетную цифру, если такие есть
end
# Метод 2
min_odd_digit = find_min_odd_digit(number)
if min_odd_digit.nil?
  puts "В числе #{number} нет нечетных цифр."
else
  puts "Минимальная нечетная цифра числа #{number}: #{min_odd_digit}"
end


# Нахождение НОД (greatest common divisors)
def gcd(a, b)
  b == 0 ? a : gcd(b, a % b)
end


# Метод 3: Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа
def sum_divisors_relative_prime_with_sum_and_not_with_product(number)
  digits = number.to_s.chars.map(&:to_i)  # Получаем массив цифр числа
  sum_of_digits = digits.sum  # Находим сумму цифр числа
  product_of_digits = digits.reduce(1, :*)  # Находим произведение цифр числа

  divisors = (1..number).select { |div| number % div == 0 }  # Находим все делители числа

  # Отбираем делители, которые взаимно просты с суммой цифр и не взаимно просты с произведением цифр
  valid_divisors = divisors.select do |div|
    gcd(div, sum_of_digits) == 1 && gcd(div, product_of_digits) != 1
  end

  valid_divisors.sum  # Возвращаем сумму таких делителей
end
# Метод 3
puts "Сумма делителей числа #{number}, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа: #{sum_divisors_relative_prime_with_sum_and_not_with_product(number)}"

