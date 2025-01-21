class Student
	attr_accessor :id, :surname, :name, :patronymic, :nomber_phone, :telegram, :email, :git
  
	def initialize(id:nil, surname:, name: , patronymic:,nomber_phone:nil, telegram: nil, email: nil, git:nil)
		@id = id
		@surname = surname
		@name = name
		@patronymic = patronymic
		@nomber_phone = nomber_phone
		@telegram = telegram
		@email = email
		@git = git
	end

	
	
	def set_id=(new_id)
		@id=new_id
	end
	def set_surname=(new_surname)
		@surname=new_surname
	end
	def set_name=(new_name)
		@name=new_name
	end
	def set_patronymic=(new_patronymic)
		@patronymic=new_patronymic
	end
	def set_nomber_phone=(new_nomber_phone)
		@nomber_phone=new_nomber_phone
	end
	def set_telegram=(new_telegram)
		@telegram=new_telegram
	end
	def set_email=(new_email)
		@email=new_email
	end
	def set_git=(new_git)
		@git=new_git
	end
	
	
	
	def get_id
		@id
	end
	def get_surname
		@surname
	end
	def get_name
		@name
	end
	def get_patronymic
		@patronymic
	end
	def get_nomber_phone
		@nomber_phone
	end
	def get_telegram
		@telegram
	end
	def get_email
		@email
	end
	def get_git
		@git
	end  
	
end