require_relative "../person/person.rb"

class Student_short < Person
	attr_reader :initials, :contacts

	def initialize(student:nil, id:nil, contacts:nil)
		if student
			student = student
			@id = student.id
			@initials = student.initials
			@git = student.git
			@contacts = student.contacts
		elsif id && contacts
			@id = id
			parse_info(contacts)
		else
			raise ArgumentError, "Неверные параметры конструктора"
		end
	end

	private

	def git=(val)
		if self.class.valid_git?(val)
			@git = val 
		else
			raise ArgumentError, "Некорректный git"
		end
	end

	def contacts=(val)
		if val.nil?
			@contacts = nil
		elsif val[:phone_number]
			if self.class.valid_phone_number?(val[:phone_number])
				@contacts = "[phone_number] #{val[:phone_number]}"
			else
				raise ArgumentError, "Некорректный номер телефона"
			end
		elsif val[:telegram]
			if self.class.valid_phone_telegram?(val[:telegram])
				@contacts = "[telegram] #{val[:telegram]}"
			else
				raise ArgumentError, "Некорректный Telegram"
			end
		elsif val[:email]
			if self.class.valid_phone_email?(val[:email])
				@contacts = "[email] #{val[:email]}"
			else
				raise ArgumentError, "Некорректный email"
			end
		else
			raise ArgumentError, "Некорректные данные связи: #{val}"
		end
	end

	def parse_info(info_str)
		parts = info_str.split(';').map(&:strip)

		if parts[0].nil?
			raise ArgumentError, "Отсутствуют инициалы"
		end
		@initials = parts[0]

		self.git = parts[1].nil? ? nil : parts[1].start_with?("Git") ? parts[1].split(': ').last : nil

		if parts[2].nil?
			self.contacts = nil
		elsif parts[2].start_with?("Связь:")
			contact_type = parts[2].match(/\[(.*?)\]/)[1]   
			contact_data = parts[2].split('] ')[1]          
			self.contacts = {contact_type.to_sym => contact_data}
		else
			raise ArgumentError, "Неверный формат контактов"
		end
	end

	def has_contacts?
		!@contacts.nil?
	end
end