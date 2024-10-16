class Student
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

  # Геттеры и сеттеры для ID
  def id
    @id
  end

  def id=(id)
    @id = id
  end

  # Геттеры и сеттеры для фамилии
  def last_name
    @last_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  # Геттеры и сеттеры для имени
  def first_name
    @first_name
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  # Геттеры и сеттеры для отчества
  def middle_name
    @middle_name
  end

  def middle_name=(middle_name)
    @middle_name = middle_name
  end

  # Геттеры и сеттеры для телефона
  def phone
    @phone
  end

  def phone=(phone)
    @phone = phone
  end

  # Геттеры и сеттеры для Телеграма
  def telegram
    @telegram
  end

  def telegram=(telegram)
    @telegram = telegram
  end

  # Геттеры и сеттеры для почты
  def email
    @email
  end

  def email=(email)
    @email = email
  end

  # Геттеры и сеттеры для гита
  def git
    @git
  end

  def git=(git)
    @git = git
  end
  