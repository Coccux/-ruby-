class Student
  # Встроенный механизм , который автоматически создаёт геттеры и сеттеры
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :git
  
  # Конструктор
  def initialize(last_name:, first_name:, middle_name:, **options)
    @id = options[:id]
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    self.phone = options[:phone]
    @telegram = options[:telegram]
    @email = options[:email]
    @git = options[:git]
  end

  def self.valid_phone?(phone)
		phone.is_a?(String) && phone.match?(/\A\+7\d{10}\z/)
  end 
  
  
  def phone=(phone)
	if phone.nil? || Student.valid_phone?(phone)
		@phone = phone
	else
		raise ArgumentError, "Некорректный номер телефона: #{phone}"
	end
  end


  # Метод для вывода информации о студенте
  def to_s
    "ID: #{id || 'не указан'}, ФИО: #{last_name} #{first_name} #{middle_name}, Телефон: #{phone || 'не указан'}, Telegram: #{telegram || 'не указан'}, Email: #{email || 'не указан'}, Git: #{git || 'не указан'}"
  end
end