require_relative 'base_student'

class StudentShort < BaseStudent
  attr_reader :short_name, :contact

  def initialize(id:, short_name:, git:, contact: nil)
    super(id: id, git: git)
    @short_name = short_name
    @contact = contact
  end

  def self.from_student(student)
    short_name = "#{student.last_name} #{student.first_name[0]}.#{student.middle_name&.[](0)}."
    contact = student.phone || student.telegram || student.email
    new(id: student.id, short_name: short_name, git: student.git, contact: contact)
  end

  def to_s
    "ID: #{@id}, ФИО: #{@short_name}, Git: #{@git}, Контакт: #{@contact || 'не указан'}"
  end
end