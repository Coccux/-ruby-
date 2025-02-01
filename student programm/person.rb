class Person
    attr_reader :id, :first_name, :name, :patronymic, :git, :contact
	
	def initialize(id: nil, first_name:, name:, patronymic:, git:, contact: nil)
		self.first_name = first_name
        self.name = name
        self.patronymic = patronymic
        self.git = git
		self.id = id if id
		self.contact = contact if contact
	end
	
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
	
	def id=(id)
		raise ArgumentError, "Wrong id format #{id}" unless Person.valid_id?(id)
		@id = id
	end
	
	def git=(git)
		raise ArgumentError, "Неверный Git: #{git}" unless Person.valid_git?(git)
		@git = git
	end
	
	protected def contact=(contact)
		@contact = contact
	end
	
	def validate_name(field, name)
		raise ArgumentError, "Неверное значение для #{field}: #{name}" unless Person.valid_name?(name)
	end
    
	def self.valid_git?(git)
        git.nil? || git =~ %r{^github\.com/[a-zA-Z0-9_\-]+$}
    end
	def self.valid_id?(id)
		id.nil? || id =~ /^\d+$/
	end
    def self.valid_name?(name)
        name =~ /^[А-ЯЁ][а-яё]+(-[А-ЯЁ][а-яё]+)?$/
    end
	
	
    def get_full_name
		unless self.class.valid_name?(self.first_name) &&
			   self.class.valid_name?(self.name) &&
			   self.class.valid_name?(self.patronymic)
			raise ArgumentError, "One or more name fields are invalid"
		end

		"full_name: #{self.first_name} #{self.name[0]}.#{self.patronymic[0]}."
	end
	
	def git_null?
		self.git.nil?
	end

	def contact_null?
		self.contact.nil?
	end

	def validate_git_and_contact
		git_null? && contact_null?
	end

	def to_s
		"#{@id} #{@full_name} #{@name} #{@patronymic}(Contacts: Git: #{@git} Email: #{@contact || 'N/A'})"
	end
end