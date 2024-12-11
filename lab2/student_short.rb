require_relative 'Student'

class StudentShort < Student
  attr_reader :contact, :last_name_initials

  def initialize(id:, last_name_initials:, git:, contact:)
    @id = validate_id?(id)
    @last_name_initials = validate_last_name_initials?(last_name_initials)
    @git = validate_git?(git)
    @contact = validate_contact?(contact)
  end

  def validate_id?(id)
    raise ArgumentError, "Некорректный ID: #{id}" unless id.is_a?(Integer) && id.positive?
    id
  end

  # Валидация фамилии и инициалов
  def validate_last_name_initials?(full_name)
    raise ArgumentError, "Некорректный формат фамилии и инициалов: #{full_name}" unless full_name =~ /^[А-ЯЁ][а-яё]+\s[А-ЯЁ]\.[А-ЯЁ]\.$/
    full_name
  end

  # Валидация ссылки на Git
  def validate_git?(git_url)
    raise ArgumentError, "Некорректный формат Git-репозитория: #{git_url}" unless git_url =~ /?github\.com\/\w+$/
    git_url
  end

  # Валидация контактов (телефон, Telegram, email)
  def validate_contact?(contact_info)
    case contact_info
    when /^\+?\d{10,15}$/
      contact_info
    when /^@\w+$/
      contact_info
    when /^[\w.+-]+@\w+\.\w+$/
      contact_info
    else
      raise ArgumentError, "Некорректный контакт: #{contact_info}"
    end
  end

  # Определение типа контакта
  def contact_type
    if contact.start_with?('+')
      'телефон'
    elsif contact.start_with?('@')
      'Telegram'
    elsif contact.include?('@')
      'email'
    else
      'неизвестный тип'
    end
  end

  # Метод для получения краткой информации
  def get_info
    "#{last_name_initials}; Git: #{git}; #{contact_type.capitalize}: #{contact}"
  end
end

  
