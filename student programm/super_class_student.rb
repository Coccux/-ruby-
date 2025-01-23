class Super_class_student
	attr_reader :id, :git
	
	def initialize(id:nil,git:nil,number_phone:nil,telegram:nil,email:nil)
		self.id = id if id
		self.git = git if git
		set_contacts(number_phone: number_phone, telegram: telegram, email: email)
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
	
	def set_contacts(number_phone: nil, telegram: nil, email: nil)
		self.number = number_phone if number_phone
		self.telegram = telegram if telegram
		self.email = email if email
	end 
	
	
	
	def self.valid_surname?(surname)
		surname.match?(/^[A-Za-zА-Яа-яЁё]+$/)
	end 

	def self.valid_name?(name)
		name.match?(/^[A-Za-zА-Яа-яЁё]+$/)
	end 

	def self.valid_patronymic?(patronymic)
		patronymic.match?(/^[A-Za-zА-Яа-яЁё]+$/)
	end  
	
	def self.valid_id?(id)
		id.to_s.match?(/^[0-9]+$/)
	end
  
	def self.valid_git?(git)
		git.match?(/^github\.com\/[\w.-]+$/)
    end 


	def self.valid_number?(number_phone)
		number_phone.match?(/^\d{11}$/)
	end

	def self.valid_telegram?(telegram)
		telegram.match?(/^@[\w]+$/)
	end 

	def self.valid_email?(email)
		email.match?(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}+$/)
	end
	
	
	
	private
	def id=(id)
		if self.class.valid_id?(id)
			@id = id
		else 
			raise ArgumentError, 'Invalid id'
		end  
	end 

	def git=(git)
		if self.class.valid_git?(git)
			@git = git
		else 
			raise ArgumentError, 'Invalid git'
		end  
	end 

	def number=(number_phone)
		if self.class.valid_number?(number_phone)
			@number_phone = number_phone
		else 
			raise ArgumentError, 'Invalid number_phone'
		end  
	end  

	def telegram=(telegram)
		if self.class.valid_telegram?(telegram)
			@telegram = telegram
		else 
			raise ArgumentError, 'Invalid telegram'
		end  
	end  
 
	def email=(email)
		if self.class.valid_email?(email)
			@email = email
		else 
			raise ArgumentError, 'Invalid email'
		end  
	end
  
	def surname=(surname)
		if self.class.valid_surname?(surname)
			@surname = surname
		else 
			raise ArgumentError, 'Invalid surname'
		end  
	end
    
	def name=(name)
		if self.class.valid_name?(name) 
			@name=name
		else 
			raise ArgumentError, 'Invalid name'
		end  
	end 

	def patronymic=(patronymic)
		if self.class.valid_patronymic?(patronymic)
			@patronymic=patronymic
		else 
			raise ArgumentError, 'Invalid patronymic'
		end  
	end
end