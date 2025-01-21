class Student
	attr_accessor :id, :surname, :name, :patronymic, :nomber_phone, :telegram, :email, :git
	
	def initialize(id:nil, surname:, name: , patronymic:,number_phone:nil, telegram: nil, email: nil, git:nil)
		@id = id
		@surname = surname
		@name = name
		@patronymic = patronymic
		@number_phone = number_phone
		@telegram = telegram
		@email = email
		@git = git
	end

	
	def print_info
		puts ("\nID студента: #{@id}\nФИО: #{@surname} #{@name} #{@patronymic}")
		puts ("Номер телефон: #{@number_phone}") if @number_phone  
		puts ("Телеграмм: #{@telegram}") if @telegram 
		puts ("Почта: #{@email}") if @email 
		puts ("Гит: #{@git}") if @git 
  end
end