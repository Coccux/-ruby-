class Student
	attr_reader :id, :surname, :name, :patronymic, :number_phone, :telegram, :email, :git
	
	def initialize(attributes = {})
		self.id = attributes[:id]
		self.surname = attributes[:surname]
		self.name = attributes[:name]
		self.patronymic = attributes[:patronymic]
		self.number_phone = attributes[:number_phone]
		self.telegram = attributes[:telegram]
		self.email = attributes[:email]
		self.git = attributes[:git]
	end

	def id=(valid_id)
		if valid_id.is_a?(Integer) && valid_id > 0
			@id = valid_id
		else
			raise ArgumentError, "ID должен быть положительным целым числом"
		end
	end
	
	def number_phone=(valid_number)
		if valid_number.match?(/^\d{11}$/)
			@number_phone = valid_number
		else
			raise ArgumentError, "Номер телефона должен содержать 11 цифр"
		end
	end
	
	def telegram=(valid_telegram)
		if valid_telegram.match?(/^@\w+$/)
			@telegram = valid_telegram
		else
			raise ArgumentError, "Некорректный формат Telegram username"
		end
	end
	
	def email=(valid_email)
		if valid_email.match?(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
			@email = valid_email
		else
			raise ArgumentError, "Некорректный формат email"
		end
	end

	def git=(valid_git)
		if valid_git.match?(/github\.com\/\w+$/)
			@git = valid_git
		else
			raise ArgumentError, "Некорректный формат GitHub URL"
		end
	end
	def validate_git
		if @git!=nil
			true
		else  
			raise "ytn ubnf"
		end
	end   

	def surname=(valid_surname)
		if valid_surname.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
			@surname = valid_surname
		else
			raise ArgumentError, "Фамилия должна содержать только буквы"
		end
	end

	def name=(valid_name)
		if valid_name.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
			@name = valid_name
		else
			raise ArgumentError, "Имя должно содержать только буквы"
		end
	end

	def patronymic=(valid_patronymic)
		if valid_patronymic.match?(/^[а-яА-ЯёЁa-zA-Z]+$/)
			@patronymic = valid_patronymic
		else
			raise ArgumentError, "Отчество должно содержать только буквы"
		end
	end
	
	def validate_contacts
		@git!=nil && @email!=nil || @telegram!=nil || @number_phone!=nil
	end 
	
	def set_contacts(number_phone: nil, telegram: nil, email: nil)
		self.number_phone = number_phone if number_phone
		self.telegram = telegram if telegram
		self.email = email if email
	end
	
	def full_name
		"#{@surname} #{@name[0]}. #{@patronymic[0]}."
	end
	
	def get_git()
		"#{"Git:  #{@git} "}"
	end
  
	def contact_info
		if @telegram
			"Telegram: #{@telegram}"
		elsif @email
			"Email: #{@email}"
		elsif @number_phone
			"Phone: #{@number_phone}"
		else
			"No contact info available"
		end
	end
	
	def getinfo()
		"#{full_name}," " #{contact_info()}" " #{get_git}"
	end
  
	def print_info
		"\nID: #{@id}\nФИО: #{full_name()}  
		#{"\nНомер телфона: #{@number_phone}" if @number_phone} 
		#{"\nПочта: #{@email}" if @email} 
		#{"\nТелеграм: #{@telegram}" if @telegram} 
		#{"\nGit: #{@git}" if @git}"
	end
end