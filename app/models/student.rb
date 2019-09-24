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

  has_many :messages, dependent: :destroy
  has_many :smessages, through: :messages, source: :teacher
  






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

end
