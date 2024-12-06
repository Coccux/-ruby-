class Student
  
  attr_reader :phone, :telegram, :emale
  
  attr_accessor :id, :last_name, :first_name, :middle_name, :git
  
  # Конструктор
  def initialize(**options)
    self.id = options[:id]
    self.last_name = options[:last_name] || 'Не указано'
    self.first_name = options[:first_name] || 'Не указано'
    self.middle_name = options[:middle_name] || 'Не указано'
    self.git = options[:git]
	
	set_contacts(phone: options[:phone], telegram: options[:telegram], email: options[:email])
	
	
  end


  def set_contacts(phone: nil, telegram: nil, email: nil)
    validate_contact(phone: phone, telegram: telegram, email: email)

    @phone = phone
    @telegram = telegram
    @email = email
  end


  def contacts
	{
	  phone: @phone || 'не указан',
      telegram: @telegram || 'не указан',
      email: @email || 'не указан'
    }
  end
  
  
  def validate_contact(phone:, telegram:, email:)
    if phone.nil? && telegram.nil? && email.nil?
      raise ArgumentError, 'Не указано ни одного контакта для связи (телефон, Telegram или email)'
    end

    raise ArgumentError, "Некорректный номер телефона: #{phone}" unless phone.nil? || Student.valid_phone?(phone)
    raise ArgumentError, "Некорректный Telegram: #{telegram}" unless telegram.nil? || Student.valid_telegram?(telegram)
    raise ArgumentError, "Некорректный email: #{email}" unless email.nil? || Student.valid_email?(email)
  end  
  
  

  

  def self.valid_id?(id)
	id.nil? || (id.is_a?(Integer) && id > 0)
  end
  
  def self.valid_name?(name)
	name.is_a?(String) && !name.strip.empty?
  end
  
  def self.valid_phone?(phone)
	phone.is_a?(String) && phone.match?(/\A\+7[\d\s\-()]{10,15}\z/)
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

  def git=(git)
    raise ArgumentError, "Некорректный Git: #{git}" unless Student.valid_git?(git)

    @git = git
  end


  
  # Метод для вывода информации о студенте
  def to_s
    "ID: #{id || 'не указан'}, ФИО: #{last_name} #{first_name} #{middle_name}, Контакты #{contacts} Git: #{git || 'не указан'}"
  end
  
  private
  attr_writer :phone, :telegram, :email
end