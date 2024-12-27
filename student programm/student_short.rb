
class StudentShort < BaseStudent
  attr_reader :lastname_initials

  def initialize(id:, git:, contact:, lastname_initials:)
    @id = id
    @git = git
    @contact = contact
    @lastname_initials = lastname_initials
  end

  def self.from_student(student)
    self.new(
      id: student.id,
      git: student.git,
      contact: student.contact,
      lastname_initials: student.short_name
    )
  end

  def self.from_string(id:, str:)
    student_short_init = {}
    params = split(str)
    student_short_init[:id] = id
    student_short_init[:lastname_initials] = params[0]
    student_short_init[:git] = params[1]
    student_short_init[:contact] = params[2..].join(' ')  
    self.new(**student_short_init)
  end

  def self.split(str)
    str.split(/,|; /)  
  end

  private_class_method :new

  def to_s
    details = []
    details << "ID: #{@id}" if @id
    details << "lastname and initials: #{@lastname_initials}"
    details << "GitHub: #{@git}" if @git
    details << "Contacts: #{@contact}" if @contact
    details.join("\n")
  end
end
  
