require_relative 'person.rb'

class Student < Person
    attr_reader :first_name, :name, :patronymic, :telegram, :email, :phone_number
    attr_writer :id

    def initialize(first_name:, name:, patronymic:, id: nil, telegram: nil, phone_number: nil, email: nil, git: nil)
        self.id = id
        self.first_name = first_name
        self.name = name
        self.patronymic = patronymic
        self.git = git
        self.set_contacts(email: email, telegram: telegram, phone_number: phone_number)
    end

    def to_s 
        "#{"ID: #{self.id}\n" unless self.id.nil?}First Name: #{ self.first_name }\nName: #{ self.name }\nPatronymic: #{ self.patronymic }\n#{"Phone Number: #{ self.phone_number }\n" unless self.phone_number.nil?}#{"Telegram: #{ self.phone_number }\n" unless self.telegram}#{"Email: #{ self.email }\n" unless self.email.nil?}#{"Git: #{ self.git }\n" unless self.git.nil?}"
    end

    def get_info
        "#{get_full_name}, git: #{self.git}, #{get_any_contact}"
    end

    def get_full_name
        "full_name: #{self.first_name} #{self.name[0]}.#{self.patronymic[0]}."
    end

    def get_any_contact
        if telegram then
            "telegram: #{self.telegram}"
        elsif email
            "email: #{self.email}"
        elsif phone_number
            "phone_number: #{self.phone_number}"
        end
    end

    def validate_contacts?
        !self.telegram.nil? || !self.email.nil? || !self.phone_number.nil?
    end

    def validate?
        super && self.validate_contacts?
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
	
    private

    def first_name=(first_name)
        unless self.class.valid_name?(first_name)
            raise ArgumentError, "Wrong first name format"
        end
        @first_name = first_name
    end

    def name=(name)
        unless self.class.valid_name?(name)
            raise ArgumentError, "Wrong name format"
        end
        @name = name
    end

    def patronymic=(patronymic)
        unless self.class.valid_name?(patronymic)
            raise ArgumentError, "Wrong patronymic format"
        end
        @patronymic = patronymic
    end

end