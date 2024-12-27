
class BaseStudent
  attr_reader :id, :name, :lastname, :middlename, :git, :contact

  def initialize(id: nil, name:, lastname:, middlename:, git:, contact: nil)
    self.lastname = lastname
    self.name = name
    self.middlename = middlename
    self.git = git
    self.id = id if id
    self.contact = contact if contact
  end
  
  
  def lastname=(lastname)
    validate_name(:lastname, lastname)
    @lastname = lastname
  end
  def name=(name)
    validate_name(:name, name)
    @name = name
  end
  def middlename=(middlename)
    validate_name(:middlename, middlename)
    @middlename = middlename
  end
  def id=(id)
    raise ArgumentError, "Неверный ID: #{id}" unless BaseStudent.id_valid?(id)
    @id = id
  end
  def git=(git)
    raise ArgumentError, "Неверный Git: #{git}" unless BaseStudent.git_valid?(git)
    @git = git
  end
  protected def contact=(contact)
    @contact = contact
  end
 


  
  def self.name_valid?(name)
    name.match?(/^[А-ЯЁA-Z][а-яёa-z-]+$/)
  end
  def self.id_valid?(id)
    id.to_s.match?(/^\d+$/)
  end
  def self.git_valid?(git)
    git.match?(/^github\.com\/[\w.-]+$/)
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
  def validate_name(field, validate_name)
    raise ArgumentError, "Неверное значение для #{field}: #{validate_name}" unless BaseStudent.name_valid?(validate_name)
  end

  def short_name
    "#{lastname} #{name[0]}.#{middlename[0]}."
  end



  def to_s
    "#{@id} #{@lastname} #{@name} #{@middlename}(Contacts: Git: #{@git} Email: #{@email} Phone: #{@phone || 'N/A'} Telegram: #{@telegram || 'N/A'})"
  end
end