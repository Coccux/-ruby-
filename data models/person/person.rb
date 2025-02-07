require 'date'

class Person
	attr_reader :id, :git

	def contacts
		raise NotImplementedError, "Метод не реализован в классе Person"
	end

	def intials
		raise NotImplementedError, "Метод не реализован в классе Person"
	end

	def validate
		has_git? && has_contacts?
	end	

	def has_git?
		!@git.nil?
	end

	def has_contacts?
		raise NotImplementedError, "Метод не реализован в классе Person"
	end

	protected

	def self.valid_phone_number?(str)
		str.nil? || str.match?(/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/)
	end

	def self.valid_name?(str)
		str.match?(/^[A-ZА-Я][a-zA-Zа-яА-Я\-]{0,49}$/)
	end

	def self.valid_id?(str)
		str.nil? || str.class == Integer
	end

	def self.valid_telegram?(str)
		str.nil? || str.match?(/^(?:@|(?:(?:(?:https?:\/\/)?t(?:elegram)?)\.me\/))(\w{4,})$/)
	end

	def self.valid_email?(str)
		str.nil? || str.match?(/^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$/)
	end

	def self.valid_git?(str)
		str.nil? || str.match?(/^(https?:\/\/(www\.)?github\.com\/)?[a-zA-Z0-9-]{1,39}\/?$/)
	end

	def self.valid_date_of_birth?(str)
		str.nil? || str.is_a?(Date) || (str.is_a?(String) && Date.parse(str) rescue false)
	end
end
