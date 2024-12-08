class Student
  attr_reader :phone, :telegram, :email
  attr_accessor :id, :last_name, :first_name, :middle_name, :git

  def initialize(**options)
    self.id = options[:id]
    self.last_name = options[:last_name] || 'Не указано'
    self.first_name = options[:first_name] || 'Не указано'
    self.middle_name = options[:middle_name] || 'Не указано'
    self.git = options[:git]

    set_contacts(phone: options[:phone], telegram: options[:telegram], email: options[:email])
    validate
  end

  def set_contacts(phone: nil, telegram: nil, email: nil)
    validate_contact(phone: phone, telegram: telegram, email: email)

    @phone = phone
    @telegram = telegram
    @contact = email
  end

  def contacts
    {
      phone: @phone || 'не указан',
      telegram: @telegram || 'не указан',
      email: @email || 'не указан'
    }
  end

  def initials
    "#{last_name} #{first_name[0]}.#{middle_name[0]}."
  end

  def primary_contact
    contact_type, contact_value = determine_contact
    "#{contact_type}: #{contact_value}"
  end

  def get_info
    "#{initials}, Git: #{git || 'не указан'}, Связь: #{primary_contact}"
  end

  private

  def determine_contact
    return ['Телефон', phone] if phone
    return ['Telegram', telegram] if telegram
    return ['Email', email] if email

    ['Нет контактов', '']
  end

  def validate
    validate_contact(phone: phone, telegram: telegram, email: email)
    raise ArgumentError, 'Git-ссылка отсутствует' if git.nil? || git.strip.empty?
  end

  def validate_contact(phone:, telegram:, email:)
    if phone.nil? && telegram.nil? && email.nil?
      raise ArgumentError, 'Не указано ни одного контакта для связи (телефон, Telegram или email)'
    end

    raise ArgumentError, "Некорректный номер телефона: #{phone}" unless phone.nil? || Student.valid_phone?(phone)
    raise ArgumentError, "Некорректный Telegram: #{telegram}" unless telegram.nil? || Student.valid_telegram?(telegram)
    raise ArgumentError, "Некорректный email: #{email}" unless email.nil? || Student.valid_email?(email)
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
end



class StudentShort
  attr_reader :id, :last_name_initials, :git, :contact

  def initialize(*args)
    if args.size == 1 && args.first.is_a?(Student)
      initialize_from_student(args.first)
    elsif args.size == 2 && args[0].is_a?(Integer) && args[1].is_a?(String)
      initialize_from_data(args[0], args[1])
    else
      raise ArgumentError, 'Некорректные аргументы для создания объекта StudentShort'
    end
  end

  private

  def initialize_from_student(student)
    @id = student.id
    @last_name_initials = "#{student.last_name} #{student.first_name[0]}.#{student.middle_name[0]}."
    @git = student.git
    @contact = student.primary_contact
  end

  def initialize_from_data(id, data)
    @id = id
    parts = data.split(',').map(&:strip)
    raise ArgumentError, 'Недостаточно данных для создания объекта StudentShort' if parts.size < 3

    @last_name_initials = parts[0]
    @git = parts[1]
    @contact = parts[2]
  end
end

