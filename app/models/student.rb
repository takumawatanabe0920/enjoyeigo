class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  has_many :requests, dependent: :destroy
  has_many :requestings, through: :requests, source: :teacher

  has_many :relationships, dependent: :destroy
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'student_id', dependent: :destroy
  has_many :permiters, through: :reverses_of_relationship, source: :teacher

  has_many :messages, :as => :messagable
  has_many :smessages, through: :messages, :source => :messagable, :source_type => 'Teacher'

  has_many :entries, :as => :entryable
  has_many :sentries, through: :entries, :source => :entryable, :source_type => "Teacher"






  def request(teacher)
    self.requests.find_or_create_by(teacher_id: teacher.id)
  end

  def unrequest(teacher)
    request = self.requests.find_by(teacher_id: teacher.id)
    request.destroy if request
  end

  def requesting?(teacher)
    self.requestings.include?(teacher)
  end

  def permiters?(teacher)
    self.permiters.include?(teacher)
  end


  def send_message(teacher, content)
    self.from_messages.create!(to_id: teacher.id, content: content)
  end

end
