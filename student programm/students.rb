class Student
	attr_accessor :id, :surname, :name, :patronymic, :nomber_phone, :telegram, :email, :git
	
	def initialize(attributes = {})
		@id = attributes[:id]
		@surname = attributes[:surname]
		@name = attributes[:name]
		@patronymic = attributes[:patronymic]
		@number_phone = attributes[:number_phone]
		@telegram = attributes[:telegram]
		@email = attributes[:email]
		@git = attributes[:git]
	end

	
	def print_info
		puts "\nID студента: #{@id}" if @id
		puts "ФИО: #{@surname} #{@name} #{@patronymic}" if @surname && @name && @patronymic
		puts "Номер телефон: #{@number_phone}" if @number_phone  
		puts "Телеграмм: #{@telegram}" if @telegram 
		puts "Почта: #{@email}" if @email 
		puts "Гит: #{@git}" if @git 
  end
end