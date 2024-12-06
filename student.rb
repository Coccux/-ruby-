class Student
  # Встроенный механизм , который автоматически создаёт геттеры и сеттеры
  attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :git
  
  # Конструктор
  def initialize(**options)
    self.id = options[:id]
    self.last_name = options[:last_name] || 'Не указано'
    self.first_name = options[:first_name] || 'Не указано'
    self.middle_name = options[:middle_name] || 'Не указано'
    self.phone = options[:phone]
    self.telegram = options[:telegram]
    self.email = options[:email]
    self.git = options[:git]
	
	
  end


  def self.valid_id?(id)
	id.nil? || (id.is_a?(Integer) && id > 0)
  end
  
  def self.valid_name?(name)
	name.is_a?(String) && !name.strip.empty?
  end
  
  def self.valid_phone?(phone)
	phone.is_a?(String) && phone.match?(/\A+7[0-9_]{10,}\z/)
  end 
  
  def self.valid_telegram?(telegram)
	telegram.nil? || telegram.match?(/\A@[a-zA-Z0-9_]{4,}\z/)
  end
  
  def self.valid_email?(email)
    email.nil? || email.match?(/\A[^@\s]+@[^@\s]+\.[^@\s]+\z/)
  end
  
  def self.valid_git?(git)
    git.nil? || git.match?(/\Agithub\.com\/[a-zA-Z0-9_-]+\/?\z/)
  end
  
  
  
  
  
  def id=(id)
    raise ArgumentError, "Некорректный ID: #{id}" unless Student.valid_id?(id)

    @id = id
  end

  def last_name=(last_name)
    raise ArgumentError, "Некорректная фамилия: #{last_name}" unless Student.valid_name?(last_name)

    @last_name = last_name
  end

  def first_name=(first_name)
    raise ArgumentError, "Некорректное имя: #{first_name}" unless Student.valid_name?(first_name)

    @first_name = first_name
  end

  def middle_name=(middle_name)
    raise ArgumentError, "Некорректное отчество: #{middle_name}" unless Student.valid_name?(middle_name)

    @middle_name = middle_name
  end

  def telegram=(telegram)
    raise ArgumentError, "Некорректный Telegram: #{telegram}" unless Student.valid_telegram?(telegram)

    @telegram = telegram
  end

  def email=(email)
    raise ArgumentError, "Некорректный email: #{email}" unless Student.valid_email?(email)

    @email = email
  end

  def git=(git)
    raise ArgumentError, "Некорректный Git: #{git}" unless Student.valid_git?(git)

    @git = git
  end




  
  
  
  
  # Метод для вывода информации о студенте
  def to_s
    "ID: #{id || 'не указан'}, ФИО: #{last_name} #{first_name} #{middle_name}, Телефон: #{phone || 'не указан'}, Telegram: #{telegram || 'не указан'}, Email: #{email || 'не указан'}, Git: #{git || 'не указан'}"
  end
end