require_relative 'super_class_student'
class Student < Super_class_student
	attr_accessor :surname, :name, :patronymic
	
	def initialize(id:nil,surname:,name:,patronymic:,number_phone:nil,telegram:nil,email:nil,git:nil,group:nil)
		super(id: id, git: git,number_phone: number_phone, telegram: telegram, email: email)
		self.id = id if id
		self.surname = surname
		self.name = name 
		self.patronymic = patronymic
	end

	
	def validate_contacts
		@git!=nil && @email!=nil || @telegram!=nil || @number_phone!=nil
	end 
	
	
  
	def print_info
		"\nID: #{@id}\nФИО: #{full_name()}  
		#{"\nНомер телфона: #{@number_phone}" if @number_phone} 
		#{"\nПочта: #{@email}" if @email} 
		#{"\nТелеграм: #{@telegram}" if @telegram} 
		#{"\nGit: #{@git}" if @git}"
	end
end