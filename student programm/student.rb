
class Student < BaseStudent
  attr_reader :phone, :telegram, :email
  
  def initialize(id: nil, lastname:, name:, middlename:, git: nil, phone: nil, telegram: nil, email: nil)
    super(lastname: lastname, name: name, middlename: middlename, git: git, id: id, contact: contact)
	set_contacts(phone: phone, telegram: telegram, email: email)
  end


  private def phone=(phone)
    if phone.nil? || Student.phone_valid?(phone)
      @phone = phone
    else
      raise ArgumentError, "Неверный телефон: #{id} #{lastname} #{name}"
    end
  end
  private def telegram=(telegram)
    if telegram.nil? || Student.telegram_valid?(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "Неверный Telegram: #{id} #{lastname} #{name}"
    end
  end
  private def email=(email)
    if email.nil? || Student.email_valid?(email)
      @email = email
    else
      raise ArgumentError, "Неверный адрес электронной почты: #{id} #{lastname} #{name}"
    end
  end


  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
    self.contact = "#{self.phone || self.telegram || self.email || nil}"
  end


  def self.phone_valid?(phone)
    phone.to_s.match?(/^(\d{11}|\+\d{11})$/)
  end
  def self.telegram_valid?(telegram)
    telegram.match?(/^@[\w]+$/)
  end
  def self.email_valid?(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end



  def get_info
    "#{short_name}; Git: #{self.git}; #{self.contact}"
  end


  def to_s
    details = []
    details << super
    details << "Phone: #{@phone}" if @phone
    details << "Telegramm: #{@telegram}" if @telegram
    details << "Mail: #{@email}" if @email
    details.join("\n")
  end
end

