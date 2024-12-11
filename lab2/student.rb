class Student
  def self.from_hash(id:, last_name_initials:, git:, contact:)
    StudentShort.new(
      id: id,
      last_name_initials: last_name_initials,
      git: git,
      contact: contact
    )
  end

  def self.from_string(str)
  
    id = str[/ID:\s*(\d+)/, 1]&.to_i
    last_name_initials = str[/Имя:\s*([^,]+)/, 1]&.strip
    git = str[/Git:\s*([^,]+)/, 1]&.strip
    contact = str[/Контакт:\s*(\S+)/, 1]
	
	if id.nil? || last_name_initials.nil? || git.nil? || contact.nil?
		raise ArgumentError, 'Не хватает данных для создания объекта' 

  end
  
    StudentShort.new(
      id: id,
	  last_name_initials: last_name_initials,
	  git: git,
	  contact: contact
    )
  end
end

