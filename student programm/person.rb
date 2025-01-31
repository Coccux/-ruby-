class Person
    attr_reader :git
	attr_accessor :id
	
	def initialize(id: nil)
		self.id = id
	end
	
	def git=(git)
        unless self.class.valid_git?(git)
            raise ArgumentError, "Wrong git link format"
        end
        @git = git
    end
	
    protected

    def self.valid_phone_number?(phone_number)
        phone_number.nil? || phone_number =~ /^(?:\+7|8)[\s-]?(?:\(?\d{3}\)?[\s-]?)\d{3}[\s-]?\d{2}[\s-]?\d{2}$/
    end

    def self.valid_telegram?(telegram)
        telegram.nil? || telegram =~ /@[a-zA-Z0-9_]{5,}$/
    end

    def self.valid_git?(git)
        git.nil? || git =~ %r{^github\.com/[a-zA-Z0-9_\-]+$}
    end
	
	def self.valid_id?(id)
		id.nil? || id =~ /^\d+$/
	end
    def self.valid_email?(email)
        email.nil? || email =~ /^[\w+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
    end

    def self.valid_name?(name)
        name =~ /^[А-ЯЁ][а-яё]+(-[А-ЯЁ][а-яё]+)?$/
    end
	
end