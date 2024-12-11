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
    data = str.scan(/ID:\s*(\d+)|Имя:\s*([\w\s.]+)|Git:\s*(\S+)|Контакт:\s*(\S+)/)
               .map(&:compact)
               .to_h
    raise ArgumentError, 'Не хватает данных для создания объекта' if data.values.size < 4

    StudentShort.new(
      id: data['ID'].to_i,
      last_name_initials: data['Имя'],
      git: data['Git'],
      contact: data['Контакт']
    )
  end
end

