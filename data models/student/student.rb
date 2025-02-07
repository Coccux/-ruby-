require "./models/person/person.rb"

class Student < Person
	include Comparable

	def initialize(surname:, firstname:, lastname:, id:nil, git:nil, email:nil, telegram:nil, phone_number:nil, date_of_birth:nil)
		self.surname = surname
		self.firstname = firstname
		self.lastname = lastname
		self.id = id
		self.git = git
		self.date_of_birth = date_of_birth
		set_contacts(email:email, telegram:telegram, phone_number:phone_number)
	end
	
	def self.new_from_hash(hash)
		self.new(**hash.transform_keys(&:to_sym))
	end
	
	attr_reader :surname, :firstname, :lastname, :phone_number, :telegram, :email, :git, :date_of_birth

	def surname=(val)
		if self.class.valid_name?(val)
			@surname = val
		else
			raise ArgumentError, "Некорректная фамилия"
		end
	end

	def firstname=(val)
		if self.class.valid_name?(val)
			@firstname = val
		else
			raise ArgumentError, "Некорректное имя"
		end
	end

	def lastname=(val)
		if self.class.valid_name?(val)
			@lastname = val
		else
			raise ArgumentError, "Некорректное отчество"
		end
	end

	def id=(val)
		if val.is_a?(String)
				@id = val.to_i
			else
				@id = val
			end
		else
			raise ArgumentError, "Некорректный ID"
		end
	end

	def date_of_birth=(val)
		if val.is_a?(String)
				@date_of_birth = Date.parse(val)
			else
				@date_of_birth = val
			end
		else
			raise ArgumentError, "Некорректная дата рождения"
		end
	end

	def set_contacts(**contacts)
		self.class.valid_email?(contacts[:email]) ? (@email = contacts[:email]) : (raise ArgumentError, "Некорректный e-mail")
		self.class.valid_telegram?(contacts[:telegram]) ? (@telegram = contacts[:telegram]) : (raise ArgumentError, "Некорректный Telegram")
		self.class.valid_phone_number?(contacts[:phone_number]) ? (@phone_number = contacts[:phone_number]) : (raise ArgumentError, "Некорректный номер телефона")
	end

	def git=(val)
		if self.class.valid_git?(val)
			@git = val 
		else
			raise ArgumentError, "Некорректный git"
		end
	end

	def to_s
		"------------------\n"+\
		"Студент: #{@surname} #{@firstname} #{@lastname}"+\
		(@id ? "\nID: #{@id}" : "")+\
		(@phone_number ? "\nНомер телефона: #{@phone_number}" : "")+\
		(@telegram ? "\nTelegram: #{@telegram}" : "")+\
		(@email ? "\ne-mail: #{@email}" : "")+\
		(@git ? "\nGit: #{@git}" : "")+\
		(@date_of_birth ? "\nДата рождения: #{@date_of_birth}" : "")+\
		"\n------------------"
	end
	
	def has_contacts?
		!@phone_number.nil? || !@telegram.nil? || !@email.nil?
	end

	def initials
		"#{surname} #{firstname[0]}.#{lastname[0]}."
	end

	def contacts
		if phone_number
		  "[phone_number] #{phone_number}"
		elsif telegram
		  "[telegram] #{telegram}"
		elsif email
		  "[email] #{email}"
		else
		  nil
		end
	end

	def get_info
		"#{initials}; Git: #{git}; Связь: #{contacts}"
	end

	def <=>(other)
		return nil unless other.is_a?(Student)
		return 1 if (date_of_birth.nil? && other.date_of_birth.nil?) || (date_of_birth.nil?)
		return -1 if other.date_of_birth.nil?

		date_of_birth <=> other.date_of_birth
	end
end