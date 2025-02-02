require_relative 'person.rb'
require_relative 'binary_tree'
class Student < Person
    attr_reader :telegram, :email, :phone_number, birth_date
    

    def initialize(first_name:, name:, patronymic:, id:, telegram: nil, phone_number: nil, email: nil, git: nil, birth_date:)
        self.set_contacts(email: email, telegram: telegram, phone_number: phone_number)
		super(first_name: first_name, name: name, patronymic: patronymic, git: git, id: id, contact: contact)
		self.birth_date = birth_date if birth_date
    end


	private def phone_number=(phone_number)
		if phone_number.nil? || Student.phone_valid?(phone_number)
			@phone_number = phone_number
		else
			raise ArgumentError, "Неверный телефон: #{id} #{surname} #{name}"
		end
	end

	private def telegram=(telegram)
		if telegram.nil? || Student.telegram_valid?(telegram)
			@telegram = telegram
		else
			raise ArgumentError, "Неверный Telegram: #{id} #{surname} #{name}"
		end
	end

	private def email=(email)
		if email.nil? || Student.email_valid?(email)
			@email = email
		else
			raise ArgumentError, "Неверный адрес электронной почты: #{id} #{surname} #{name}"
		end
	end
	
	
	def self.valid_phone_number?(phone_number)
        phone_number.nil? || phone_number =~ /^(?:\+7|8)[\s-]?(?:\(?\d{3}\)?[\s-]?)\d{3}[\s-]?\d{2}[\s-]?\d{2}$/
    end

    def self.valid_telegram?(telegram)
        telegram.nil? || telegram =~ /@[a-zA-Z0-9_]{5,}$/
    end
	
    def self.valid_email?(email)
        email.nil? || email =~ /^[\w+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
    end
	
	def self.valid_birth_date?(date)
		Date.parse(date) rescue false
	end
	
	def birth_date=(date)
		if date.nil? || self.class.valid_birth_date?(date)
			@birth_date = date
		else
			raise ArgumentError, "Некорректная дата рождения"
		end
	end
	
	def to_s
		details = []
		details << super
		details << "Phone: #{@phone_number}" if @phone_number
		details << "Telegramm: #{@telegram}" if @telegram
		details << "Mail: #{@email}" if @email
		details << "Birth date: #{@birth_date}" if @birth_date
		details.join("\n")
	end
  
	def get_info
        "#{get_full_name}, git: #{self.git}, #{get_contact}"
    end
    
	def set_contacts(contacts)
        unless self.class.valid_phone_number?(contacts[:phone_number])
            raise ArgumentError, "Wrong phone number format"
        end
        @phone_number = contacts[:phone_number]

        unless self.class.valid_telegram?(contacts[:telegram])
            raise ArgumentError, "Wrong telegram format"
        end
        @telegram = contacts[:telegram]

        unless self.class.valid_email?(contacts[:email])
            raise ArgumentError, "Wrong Email format"
        end
        @email = contacts[:email]
    end
	
end