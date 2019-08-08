class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  has_many :requests
  has_many :requestings, through: :requests, source: :teacher
  has_many :reverses_of_request, class_name: 'Request', foreign_key: 'teacher_id'
  has_many :requesters, through: :reverses_of_request, source: :student

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

  def permit(student)
    self.requests.find_or_create_by(student_id: student.id)
  end

  def reject(teacher)
    request = self.requests.find_by(student_id: student.id)
    request.destroy if request
  end
end
