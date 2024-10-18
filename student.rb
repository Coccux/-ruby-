class Student
  # Встроенный механизм , который автоматически создаёт геттеры и сеттеры
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :git
  
  # Конструктор
  def initialize(last_name, first_name, middle_name, id = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end


  
  # Метод для вывода информации о студенте
  def to_s
    "ID: #{id || 'не указан'}, ФИО: #{last_name} #{first_name} #{middle_name}, Телефон: #{phone || 'не указан'}, Telegram: #{telegram || 'не указан'}, Email: #{email || 'не указан'}, Git: #{git || 'не указан'}"
  end
end